examples - change tree
exampleCommitBrowser
	| repository changeSet |
	repository := IceRepository origin: 'git@github.com:npasserini/iceberg.git'.
	changeSet := IceWorkingCopyDiff forRepository: repository.
	IceCommitBrowser new
		changeSet: changeSet;
		openWithSpec.
