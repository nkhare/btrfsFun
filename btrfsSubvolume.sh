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
btrfs subvolume create /mnt/SV2
btrfs subvolume create /mnt/SV2/SV21
echo "*********** Subvolume list ***********"
echo "******* btrfs subvolume list <dest> ****"
btrfs subvolume list /mnt
echo "*********** Create dir/files ***********"
mkdir /mnt/D1
touch /mnt/D1/f{1,2,3}
mkdir -p /mnt/SV1/Dir1/Dir11
touch /mnt/SV1/Dir1/f{1,2,3}
mkdir -p /mnt/SV2/Dir1/Dir11
touch /mnt/SV2/Dir1/Dir11/f{1,2,3}
tree /mnt
echo "*********** Mounting Subvolume on /tmp/subvol ***********"
echo "******* mount -o subvolid=259 $disk1 /tmp/subvol ********"
mkdir -p /tmp/subvol
mount -o subvolid=259 $disk1 /tmp/subvol
tree /tmp/subvol
umount /tmp/subvol

echo "***** Setting up default subvolume ******" 
echo "***** btrfs subvolume set-default <vol-id> <path> *****"
btrfs subvolume set-default 256 /mnt
umountFs /mnt &> /dev/null
mountFs /mnt
tree /mnt

#echo "****** Setting back to Default ********"
btrfs subvolume set-default 5 /mnt
umountFs /mnt &> /dev/null
mountFs /mnt

echo "*********** Subvolume Remove ***********"
echo "*** btrfs subvolume delete [<dest/>]<name> **"
btrfs subvolume delete /mnt/SV1
btrfs subvolume delete /mnt/SV2/SV21
btrfs subvolume delete /mnt/SV2

umountFs /mnt &> /dev/null
wipeFs

