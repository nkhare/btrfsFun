tarFile=$1
source ./btrfsUtils.sh
umountFs /mnt &> /dev/null
wipeFs &> /dev/null

echo "*********** Create FS ***********"
createFs
mountFs /mnt
df -h /mnt

echo "*********** Create Subvolume ***********"
echo "*** btrfs subvolume create [<dest/>]<name> ** "
btrfs subvolume create /mnt/SV1

echo "*********** Create dir/files ***********"
mkdir -p /mnt/SV1/Dir1/
touch /mnt/SV1/Dir1/f{1,2,3}
tree /mnt

echo "*********** Create Snapshot ***********"
echo "*** btrfs subvolume snapshot <source> <destination> | [<dest/>]<name> ** "
btrfs subvolume snapshot /mnt/SV1 /mnt/snapSV1

echo "*********** List Subvolume and Snapshot ***********"
echo "******* btrfs subvolume list <dest> ****"
btrfs subvolume list /mnt

echo "******* Create some files under Subvolume *******"
touch /mnt/SV1/Dir1/f{4,5,6}
tree /mnt/SV1

echo "******* Create some files on top of snapshot (writable snapshot)  *******"
touch /mnt/snapSV1/fsnap{100,101,102}
tree /mnt/snapSV1


echo "*********** Subvolume Remove ***********"
echo "*** btrfs subvolume delete [<dest/>]<name> **"
btrfs subvolume delete /mnt/SV1
btrfs subvolume delete /mnt/snapSV1

umountFs /mnt &> /dev/null
wipeFs

