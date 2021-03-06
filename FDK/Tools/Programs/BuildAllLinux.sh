# How to find and add all the xcode files for a new program:
# find .   \( -path "*/xcode4/*" \)  -and \( \(  -name BuildAll.sh \) -or \( -name project.pbxproj \) -or \( -name contents.xcworkspacedata  \) \)  -exec p4 add {} \;curDir=`pwd`
curDir=`pwd`

buildAllList=`ls -1 */build/linux/gcc/BuildAll.sh`
for shFile in $buildAllList
do
	echo "***Running $shFile"
	newDir=`dirname $shFile`
	shFile=`basename $shFile`
	cd $newDir
	sh  $shFile $1
	cd $curDir
done
echo "Done"