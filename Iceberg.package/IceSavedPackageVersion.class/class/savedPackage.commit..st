instance creation
savedPackage: anIceSavedPackage commit: aLGitCommit 
	^ self new 
		package: anIceSavedPackage package;
		repository: anIceSavedPackage repository;
		commitId: aLGitCommit id hexString;
		author: aLGitCommit author name;
		yourself
