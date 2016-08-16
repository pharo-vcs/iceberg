api
getVersions
	^ self basicGetVersions reverse collect: [ :entry | 
		IceSavedPackageVersion new 
			package: package;
			info: entry info;
			entry: entry;
			commitId: entry commitID hex;
			yourself 
	]
