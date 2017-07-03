tests
testAddRemote
	| backend |
	repository := IceRepositoryCreator new 
		url: self scpOriginUrl;
		createRepository.
	backend := repository backend.
	
	self assert: backend remotes size equals: 1.
	backend addRemote: (IceRemote 
		name: 'other-for-test'
		url: 'git@github.com/pharo-vcs/pharo-git-test.git').
	self assert: backend remotes size equals: 2.