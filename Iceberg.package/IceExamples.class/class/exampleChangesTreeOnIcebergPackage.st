examples - change tree
exampleChangesTreeOnIcebergPackage
	| repository changeSet |
	repository := IceRepository origin: 'git@github.com:npasserini/pharo-git-test.git'.
	changeSet := IceWorkingCopyDiff forRepository: repository.
	IceChangesTreeView new
		model: changeSet;
		openWithSpec.
