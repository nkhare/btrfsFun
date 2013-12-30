source ./btrfsUtils.sh
umountFs /mnt
wipeFs &> /dev/null

echo "*********** Default ***********"
createFs
mountFs /mnt
showFs 
btrfsDf /mnt
df -h /mnt
umountFs /mnt
wipeFs

echo "*********** Data RAID = raid1 , Metadata RAID = raid0  ***********"
createFs raid0 raid1
mountFs /mnt
showFs 
btrfsDf /mnt
df -h /mnt
umountFs /mnt
wipeFs


echo "*********** Data RAID = raid1 , Metadata RAID = raid1 **********"
createFs raid1 raid1
mountFs /mnt
showFs 
btrfsDf /mnt
df -h /mnt
umountFs /mnt
wipeFs


echo "*********** Data RAID = single , Metadata RAID = raid1  ***********"
createFs single raid0
mountFs /mnt
showFs 
btrfsDf /mnt
df -h /mnt
umountFs /mnt
wipeFs
