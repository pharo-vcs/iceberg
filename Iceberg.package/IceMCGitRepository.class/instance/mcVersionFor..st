private
mcVersionFor: anIcePackageVersion
	^ (IceMCFileTreeGitStReader on: directory fileName: (anIcePackageVersion packageName, '.package'))
		commitID: anIcePackageVersion commit id;
		info: anIcePackageVersion info;
		repository: self;
		version