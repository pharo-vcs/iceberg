private
mcVersionFor: anIcePackageVersion
	^ (IceMCFileTreeGitStReader on: directory fileName: (anIcePackageVersion packageName, '.package'))
		commitID: anIcePackageVersion commitId;
		info: anIcePackageVersion info;
		repository: self;
		version