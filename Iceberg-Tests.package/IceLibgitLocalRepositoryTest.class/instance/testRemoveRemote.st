tests
testRemoveRemote
	| backend |
	repository := IceRepositoryCreator new 
		url: 'git@github.com/npasserini/pharo-git-test.git';
		createRepository.
	backend := repository backend.
	
	self assert: backend remotes size equals: 1.
	backend removeRemote: repository origin.
	self assert: backend remotes size equals: 0.