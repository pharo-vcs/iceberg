tests
testAddRemote
	| backend |
	repository := IceRepositoryCreator new 
		url: 'git@github.com/npasserini/pharo-git-test.git';
		createRepository.
	backend := repository backend.
	
	self assert: backend remotes size equals: 1.
	backend addRemote: (IceRemote 
		name: 'other-for-test'
		url: 'git@github.com/npasserini/pharo-git-test.git').
	self assert: backend remotes size equals: 2.