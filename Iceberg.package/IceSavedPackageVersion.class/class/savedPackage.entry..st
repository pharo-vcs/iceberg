instance creation
savedPackage: anIceSavedPackage entry: aGitFileTreePackageEntry
	^ self new 
		package: anIceSavedPackage package;
		repository: anIceSavedPackage repository;
		entry: aGitFileTreePackageEntry;
		commitId: aGitFileTreePackageEntry commitID hex;
		yourself