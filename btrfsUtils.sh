disk1=/dev/sda
disk2=/dev/sdb
disk3=/dev/sdc
disk4=/dev/sdd

sleeep=`sleep 2`

function createFs()
{
	if [ $# -ne 2 ]
	then
		mkfs.btrfs $disk1 $disk2 $disk3 &> /dev/null
	else
		metaRaid=$1
		dataRaid=$2
		mkfs.btrfs -m $metaRaid -d $dataRaid $disk1 $disk2 $disk3 $disk4 &> /dev/null
	fi

	if [ $? -ne 0 ]
	then
		echo "Creation of file-system failed"
		exit 1
	fi
}

function labelFs()
{
	label=$1
	echo "btrfs filesystem label $disk1 $label"
	btrfs filesystem label $disk1 $label
}

function wipeFs()
{
	wipefs -a $disk1 $disk2 $disk3 $disk4 &> /dev/null
}

function showFs()
{
 	label=$1
	btrfs filesystem show $label
}

function mountFs()
{
	mntPt=$1
	mount $disk1 $mntPt
}

function umountFs()
{
	mntPt=$1
	umount $mntPt -f
}

function btrfsDf()
{
	mntPt=$1
	btrfs fi df $mntPt 
}

function lstree() 
{
echo
if [ "$1" != "" ]  #if parameter exists, use as base folder
   then cd "$1"
   fi
pwd
ls -R | grep ":$" |   \
   sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'
# 1st sed: remove colons
# 2nd sed: replace higher level folder names with dashes
# 3rd sed: indent graph three spaces
# 4th sed: replace first dash with a vertical bar
if [ `ls -F -1 | grep "/" | wc -l` = 0 ]   # check if no folders
   then echo "   -> no sub-directories"
   fi
echo
}
