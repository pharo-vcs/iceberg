repository handling
createRepository
	self repository: (self storageClass new
		localRepository: self location;
		remoteUrl: self origin url;
		subdirectory: (self subdirectory ifNil: '');
		readonly: false).
