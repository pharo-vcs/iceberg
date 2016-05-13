examples - change tree
exampleSynchronizer
	| repository changeSet |
	repository := Git new origin: 'git@github.com:npasserini/pharo-git.git'; branch: 'newChangeSets'.
	changeSet := IceWorkingCopyDiff forRepository: repository.
	IceSynchronizer new
		changeSet: changeSet;
		openWithSpec.
