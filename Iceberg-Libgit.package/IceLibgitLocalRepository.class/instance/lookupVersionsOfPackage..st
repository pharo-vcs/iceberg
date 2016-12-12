querying
lookupVersionsOfPackage: package 
	"Load versions from the real repository, latest first"
	"This method is outdated, please check IceSavedPackage>>#loadVersionsInBranch: to see new way of doing it."
	| commitsChangingPackage | 
	commitsChangingPackage := OrderedCollection new.
	
	self commitsInCurrentBranchDo: [ :commit |
		(commit changesFileNamed: package directoryName)
			ifTrue: [ commitsChangingPackage add: commit ]
	].

	^ (commitsChangingPackage reverse collectWithIndex: [ :commit :index |
		IceSavedPackageVersion new 
			package: package;
			commitId: commit id hexString;
			info: (self createInfoForPackage: package commit: commit versionNumber: index);
			yourself
	]) reverse
