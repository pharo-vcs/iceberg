examples - change tree
exampleChangesTreeOnTestPackage
	| git changes |
	Transcript show: '----------------------------------'; cr.
	git := Git new origin: 'git@github.com:npasserini/pharo-git-test.git'.
	changes := IceRepositoryChangeSet fromRepository: git.
	IceChangesTreeView new
		model: changes;
		openWithSpec.
		
	Transcript flush.