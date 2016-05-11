examples - change tree
exampleSynchronizerRepackaging
	| repository changeSet |
	repository := Git new 
		origin: 'git@github.com:npasserini/pharo-git.git'; 
		branch: 'repackaging'.
	changeSet := IceRepositoryChangeSet fromRepository: repository.
	IceSynchronizer new
		changeSet: changeSet;
		openWithSpec.
