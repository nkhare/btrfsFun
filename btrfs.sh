disk1=/dev/sda
disk2=/dev/sdb
disk3=/dev/sdc
disk4=/dev/sdd

sleeep=`sleep 2`

#Create
echo "mkfs.btrfs $disk1 $disk2 $disk3"
mkfs.btrfs $disk1 $disk2 $disk3
$sleeep

#Show 
echo "btrfs filesystem show " 
btrfs filesystem show 
$sleeep

#Label the filesystem
echo "btrfs filesystem label  $disk1 btrfstest"
btrfs filesystem label $disk1 btrfstest
$sleeep

#Mount the filesystem 
echo "mount $disk1 /mnt"
mount $disk1 /mnt
$sleeep


#Wiping up the btrfs singnature
echo "wipefs $disk1 $disk2 $disk3"
#wipefs -a $disk1 $disk2 $disk3




