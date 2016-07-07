private
lookupVersionsOfPackage: package 
	"Load versions from the real repository, latest first"
	^ (self getVersionsForPackageDirectoryName: package packageName, '.package')
		reverse collect: [ :entry | 
			IceSavedPackageVersion new 
				package: package;
				info: entry info;
				entry: entry;
				commitId: entry commitID hex;
				yourself ]
