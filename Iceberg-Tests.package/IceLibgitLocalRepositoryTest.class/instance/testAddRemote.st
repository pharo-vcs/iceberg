tests
testAddRemote
	repository := IceRepositoryCreator new 
		url: self scpOriginUrl;
		createRepository.	

	self assert: repository remotes size equals: 1.
	repository addRemote: (IceGitRemote 
		name: 'other-for-test'
		url: 'git@github.com/pharo-vcs/pharo-git-test.git').
	self assert: repository remotes size equals: 2.