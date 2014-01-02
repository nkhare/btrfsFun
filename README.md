btrfsFun
========

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

Tests
========
Filesystem Creation/Mounting
=========
Create filesystem with different RAID configuration for Data and
metadate
mkfs.btrfs -m $metaRaidType -d $dataRaidType $disk1 $disk2 $disk3 $disk4
Mount the filesystem
Look at btrfs df output
btrfs filesystem df <mount-point>
Look at Linux df output.
 
Script : btrfsFs.sh
 
 
Filesystem Grow Shrink
=========
Create the file-system
Shrink it
Grow it
 
Script : btrfsGrowShrink.sh
 
Adding and removing disk from btrfs volume
=========
Create the file-system
Mount it
Untar a file
Add new disk
Re-balance the data
Remove a disk
 
Script : btrfsAddRemoveDisk.sh
 
Compression
Create the file-system
Mount it
Untar a file
Look at the disk usage
Un-mount
Delete file-system
Repeat above steps while mount the file-system with lzo and zlib
compress option
mount -o compress=<lzo/zlib> <disk> <mount-point>
 
Script : btrfsCompression.sh
 
Subvolume
Store User visible files and directories.
Create the file-system
Mount it
Create subvolumes
List subvolumes
Create files/directories
Mount  a subvolume to different directory
Change the default subvolume to the file-system, so that by default
given subvolume mounts
Reset to defaults
Delete subvolumes
 
Script :btrfsSubvolume.sh
 
Snapshot
A snapshot is a copy of an entire subvolume taken at a given point in
time. Snapshots let you save the state of a file system at a particular
point in time and recreate it on another machine to simplify data
migration. You can create snapshots almost instantly, and initially they
consume virtually no additional disk space (any modest impact results
from additional metadata).

Create the file-system
Mount it
Create subvolumes
Create directories/files on subvolume
Create snapshot
List snapshot
Create files on the subvolume
Create files on snapshot
Looks files under subvolume and snapshot
Delete snapshot and subvolume
 
Script : btrfsSnapshot.sh
 
Send/Receive
Create two file-systems
Mount them
Copy some files on first file-system (mount-point)
Look at df outout
Create a read-only snapshot for first file-system
Send the content of snapshot to a file
Receive the content from above create files to second file-system
Look at df outout
 
Script : btrfsSendReceive.sh
 
Scrub
The scrub job scans the entire file system for integrity and
automatically attempts to report and repair any bad blocks it finds
along the way.
Create the file-system
Mount it
Untar a file
Start the scrub
Get the status of scrub

Script : btrfsScrub.sh
 
References
BTRFS: The Linux B-tree Filesystem
btrfs Wiki
http://www.funtoo.org/BTRFS_Fun
How I Use the Advanced Capabilities of the Btrfs File System
https://btrfs.wiki.kernel.org/index.php/UseCase
A Beginner's Guide To btrfs | HowtoForge - Linux Howtos and Tutorials


 
