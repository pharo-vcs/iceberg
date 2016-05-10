examples - change tree
exampleChangesTreeOnIcebergPackage
	| git changes |
	git := Git new origin: 'git@github.com:npasserini/pharo-git.git'.
	changes := IceRepositoryChangeSet fromRepository: git.
	IceChangesTreeView new
		model: changes;
		openWithSpec.
