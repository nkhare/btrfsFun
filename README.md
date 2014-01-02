btrfsFun
========

Learning Btrfs

Goal
========
Understand Btrfs features with some examples.
 
Setup
========
1. A VM with 4 virtual disks attached.
2. Download test scripts from following
    - nkhare/btrfsFun · GitHub
3. Get a tar file on the VM, which we can use during experiments
    -  https://www.kernel.org/pub/linux/kernel/v3.x/linux-3.12.6.tar.xz
    -  xz -d https://www.kernel.org/pub/linux/kernel/v3.x/linux-3.12.6.tar.xz
4. Install tree package on the VM , which would helpful in looking some of the outputs
    - rpm -ihv ftp://mirror.switch.ch/pool/2/mirror/fedora/linux/releases/test/20-Beta/Fedora/x86_64/os/Packages/t/tree-1.6.0-11.fc20.x86_64.rpm
5. Modify btrfsUtils.sh and update disk information like
    disk1=/dev/sda
    disk1=/dev/sdb
    disk3=/dev/sdc
    disk4=/dev/sdd
 
