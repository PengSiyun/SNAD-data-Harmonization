****Author:  Siyun Peng
****Date:    2021/02/18
****Version: 16
****Purpose: Unzip and save files for Netcanvas 

clear

***************************************************************
//	#1 Unzip files into folders
***************************************************************

local sourcedir "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\SNAD Informant Interviews" //download and save zip files in here
local unzipdir "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\Netcanvas Informant Interviews"
cap mkdir "`unzipdir'" //create a new directory

/*
    First, let's unzip all the zip files
*/
local fls : dir "`sourcedir'" files "*.zip"
cd "`unzipdir'"
foreach f of local fls {
        di "Working on `f'"
        unzipfile "`sourcedir'/`f'", replace
}

*move files to different folders 

mvfiles , infolder("`unzipdir'") outfolder("`unzipdir'/ego") match("*ego*") makedirs erase //ssc install mvfiles
mvfiles , infolder("`unzipdir'") outfolder("`unzipdir'/alter") match("*attributeList_name*") makedirs erase
mvfiles , infolder("`unzipdir'") outfolder("`unzipdir'/interviewer") match("*attributeList_Inter*") makedirs erase
mvfiles , infolder("`unzipdir'") outfolder("`unzipdir'/alter_tie") match("*edgeList*") makedirs erase


* clean up the zip files 
local fls : dir "`sourcedir'" files "*.zip"
foreach f of local fls {
    erase "`sourcedir'/`f'"
}
