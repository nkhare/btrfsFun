source ./btrfsUtils.sh
umountFs /mnt
wipeFs &> /dev/null

if [ $# -ne 1 ]
then
	echo "Please provide the tar file to untar on btrfs mount point"
	exit 1
fi
tarFile=$1

echo "*********** Creation ***********"
createFs raid1 raid1 
mountFs /mnt
btrfsDf /mnt
df -h /mnt

echo "*********** Untar a file ********" 
#tar xf $tarFile -C /mnt
showFs 


#umountFs /mnt
#wipeFs
