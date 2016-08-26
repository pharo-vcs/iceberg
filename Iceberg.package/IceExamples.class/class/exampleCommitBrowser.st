examples - commit
exampleCommitBrowser
	| repository |
	repository := IceRepository origin: 'git@github.com:npasserini/iceberg.git'.
	IceCommitModel new
		model: repository;
		openWithSpec.
