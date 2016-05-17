examples - change tree
exampleSynchronizer
	| repository changeSet |
	repository := IceRepository new origin: 'git@github.com:npasserini/pharo-git.git'.
	changeSet := IceWorkingCopyDiff forRepository: repository.
	IceSynchronizer new
		changeSet: changeSet;
		openWithSpec.
