initialization
newDirectoryDataSource

	^ IceTipDirectoryDataSource new
		tool: self;
		directory: self model fileSystem;
		yourself