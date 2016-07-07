private
lookupVersionsOfPackage: anIceSavedPackage 
	"Load versions from the real repository, latest first"
	| commitsChangingPackage | 
	commitsChangingPackage := OrderedCollection new.
	
	self commitsInCurrentBranchDo: [ :commit |
		(commit changesFileNamed: anIceSavedPackage packageName, '.package')
			ifTrue: [ commitsChangingPackage add: commit ]
	].

	^ (commitsChangingPackage reverse collectWithIndex: [ :commit :index |
		IceSavedPackageVersion new 
			package: anIceSavedPackage;
			commitId: commit id hexString;
			info: (self createInfoForPackage: anIceSavedPackage commit: commit versionNumber: index);
			yourself
	]) reverse
