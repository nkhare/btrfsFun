if [ $# -ne 1 ]
then
	echo "Please provide the tar file to untar on btrfs mount point"
	exit 1
fi

tarFile=$1
source ./btrfsUtils.sh
umountFs /mnt &> /dev/null
wipeFs &> /dev/null

echo "*********** No Compression ***********"
createFs
mountFs /mnt
tar xf $tarFile -C /mnt/
btrfsDf /mnt
df -h /mnt
umountFs /mnt
wipeFs

echo "*********** lzo ***********"
createFs
mount -o compress=lzo $disk1 /mnt
tar xf $tarFile -C /mnt/
btrfsDf /mnt
df -h /mnt
umountFs /mnt
wipeFs

echo "*********** zlib ***********"
createFs
mount -o compress=zlib $disk1 /mnt
tar xf $tarFile -C /mnt/
btrfsDf /mnt
df -h /mnt
umountFs /mnt
wipeFs
