examples - change tree
exampleSynchronizerTest
	| repository changeSet |
	repository := IceRepository origin: 'git@github.com:npasserini/pharo-git-test.git'.
	changeSet := IceWorkingCopyDiff forRepository: repository.
	IceSynchronizer new
		changeSet: changeSet;
		openWithSpec.
