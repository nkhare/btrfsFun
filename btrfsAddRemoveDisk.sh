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
createFs
mountFs /mnt
df -h /mnt

echo "*********** Untar a file ********" 
tar xf $tarFile -C /mnt
showFs 


echo "*********** Add Disk ***********"
echo "******** btrfs device add $disk4 /mnt ******"
btrfs device add $disk4 /mnt
showFs 
df -h /mnt


echo "*********** Rebalance the data ***********"
echo "********* btrfs filesystem balance /mnt ********"
btrfs filesystem balance /mnt
showFs
df -h /mnt

echo "*********** Remove Disk ***********"
echo "********* btrfs device delete $disk3 /mnt *********"
btrfs device delete $disk3 /mnt
showFs 
df -h /mnt


umountFs /mnt
wipeFs
