examples - change tree
exampleChangesTree
	| git changes |
	Transcript show: '----------------------------------'; cr.
	git := Git new origin: 'git@github.com:npasserini/pharo-git.git'.
	changes := IceRepositoryChangeSet fromRepository: git.
	IceChangesTreeView new
		model: changes;
		openWithSpec.
		
	Transcript flush.