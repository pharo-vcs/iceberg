initialization
newDirectoryDataSource

	^ IceTipDirectoryDataSource new
		directory: self model fileSystem;
		yourself