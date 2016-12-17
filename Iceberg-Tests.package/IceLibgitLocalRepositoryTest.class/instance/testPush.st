tests
testPush
	repository := IceRepositoryCreator new 
		url: 'git@github.com:npasserini/pharo-git-test.git';
		createRepository.
	self assert: repository backend class equals: IceLibgitLocalRepository.

	self scenarioOutgoingCommit.
	repository push
