source ./btrfsUtils.sh
umountFs /mnt &> /dev/null
wipeFs &> /dev/null

if [ $# -ne 1 ]
then
	echo "Please provide the tar file to untar on btrfs mount point"
	exit 1
fi
tarFile=$1

echo "*********** Creation ***********"
createFs 
mountFs /mnt
df -h /mnt

echo "*********** Untar a file ********" 
tar xf $tarFile -C /mnt
showFs 


echo "******** Start the scrub *******"
echo "******* btrfs scrub start /mnt ******"
btrfs scrub start /mnt

sleep 5

echo "******** Status of the scrub ******"
echo "******* btrfs scrub status /mnt ******"
btrfs scrub status /mnt

umountFs /mnt
wipeFs
