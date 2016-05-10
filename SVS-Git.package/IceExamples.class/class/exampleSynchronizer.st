examples - change tree
exampleSynchronizer
	| repository changeSet |
	repository := Git new origin: 'git@github.com:npasserini/pharo-git.git'.
	changeSet := IceRepositoryChangeSet fromRepository: repository.
	IceSynchronizer new
		changeSet: changeSet;
		openWithSpec.
