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
1. Create filesystem with different RAID configuration for Data and metadata
mkfs.btrfs -m $metaRaidType -d $dataRaidType $disk1 $disk2 $disk3 $disk4
2. Mount the filesystem
3. Look at btrfs df output
  btrfs filesystem df <mount-point>
4. Look at Linux df output.
 
Script : btrfsFs.sh
 
 
Filesystem Grow Shrink
=========
1. Create the file-system
2. Shrink it
3. Grow it
 
Script : btrfsGrowShrink.sh
 
Adding and removing disk from btrfs volume
========
1. Create the file-system
2. Mount it
3. Untar a file
4. Add new disk
5. Re-balance the data
6. Remove a disk
 
Script : btrfsAddRemoveDisk.sh
 
Compression
========
1. Create the file-system
2. Mount it
3. Untar a file
4. Look at the disk usage
5. Un-mount
6. Delete file-system
7. Repeat above steps while mount the file-system with lzo and zlib
compress option
  - mount -o compress=<lzo/zlib> <disk> <mount-point>
 
Script : btrfsCompression.sh
 
Subvolume
========

Store User visible files and directories.

1. Create the file-system
2. Mount it
3. Create subvolumes
4. List subvolumes
5. Create files/directories
6. Mount  a subvolume to different directory
7. Change the default subvolume to the file-system, so that by default given subvolume mounts
8. Reset to defaults
9. Delete subvolumes
 
Script :btrfsSubvolume.sh
 
Snapshot
========
A snapshot is a copy of an entire subvolume taken at a given point in
time. Snapshots let you save the state of a file system at a particular
point in time and recreate it on another machine to simplify data
migration. You can create snapshots almost instantly, and initially they
consume virtually no additional disk space (any modest impact results
from additional metadata).

Create the file-system
========
1. Mount it
2. Create subvolumes
3. Create directories/files on subvolume
4. Create snapshot
5. List snapshot
6. Create files on the subvolume
7. Create files on snapshot
8. Looks files under subvolume and snapshot
9. Delete snapshot and subvolume
 
Script : btrfsSnapshot.sh
 
Send/Receive
========
1. Create two file-systems
2. Mount them
3. Copy some files on first file-system (mount-point)
4. Look at df outout
5. Create a read-only snapshot for first file-system
6. Send the content of snapshot to a file
7. Receive the content from above create files to second file-system
8. Look at df outout
 
Script : btrfsSendReceive.sh
 
Scrub
========

The scrub job scans the entire file system for integrity and
automatically attempts to report and repair any bad blocks it finds
along the way.

1. Create the file-system
2. Mount it
3. Untar a file
4. Start the scrub
5. Get the status of scrub

Script : btrfsScrub.sh
 
References
========
- BTRFS: The Linux B-tree Filesystem
- btrfs Wiki
- http://www.funtoo.org/BTRFS_Fun
- How I Use the Advanced Capabilities of the Btrfs File System
- https://btrfs.wiki.kernel.org/index.php/UseCase
- A Beginner's Guide To btrfs | HowtoForge - Linux Howtos and Tutorials


 
