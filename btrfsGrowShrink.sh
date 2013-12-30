source ./btrfsUtils.sh
umountFs /mnt
wipeFs &> /dev/null

echo "*********** Creation ***********"
createFs
mountFs /mnt
showFs 
df -h /mnt

echo "*********** Shink ***********"
btrfs filesystem resize -1g /mnt
df -h /mnt

echo "*********** Further Shink ***********"
btrfs filesystem resize -700m /mnt
df -h /mnt

echo "*********** Further Shink ***********"
btrfs filesystem resize -100m /mnt
df -h /mnt

echo "*********** Grow ***********"
btrfs filesystem resize +500m /mnt
df -h /mnt

echo "*********** Futher Grow ***********"
btrfs filesystem resize max /mnt
df -h /mnt

umountFs /mnt
wipeFs
