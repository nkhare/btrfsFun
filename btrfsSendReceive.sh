tarFile=$1
source ./btrfsUtils.sh
umountFs /mnt &> /dev/null
umountFs /mnt1 &> /dev/null
umountFs /mnt2 &> /dev/null
wipeFs &> /dev/null

echo "*********** Create Two filesystems  ***********"
mkfs.btrfs $disk1 $disk2   
mkfs.btrfs $disk3 $disk4

echo "****** Mount the filesystems ***********"
mkdir -p /mnt1 /mnt2
mount $disk1 /mnt1
mount $disk3 /mnt2
df -h | grep mnt

echo "******* Create some content on mount 1*****"
echo "******* cp -r /etc/udev /mnt1 *******"
cp -r /etc/udev /mnt1
sync
df -h | grep mnt

echo "****** Create Snapshot of for first subvolume ***"
echo "****** btrfs subvolume snapshot -r /mnt1 /mnt1/backup *****"
btrfs subvolume snapshot -r /mnt1 /mnt1/backup
sync

echo "Send the contents of the read-only snapshot to a file **** "
echo "********** btrfs send -f /tmp/btrfsSend /mnt1/backup/ ***** "
btrfs send -f /tmp/btrfsSend /mnt1/backup/

echo "****** Receive the content from the file to a subvolume ******" 
btrfs receive -f /tmp/btrfsSend /mnt2 
sync
df -h | grep mnt

umountFs /mnt &> /dev/null
umountFs /mnt1 &> /dev/null
umountFs /mnt2 &> /dev/null
wipeFs

