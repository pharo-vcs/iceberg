initialization
newDirectoryDataSource
		
	^ IceTipDirectoryDataSource new
		directory: self model location;
		yourself