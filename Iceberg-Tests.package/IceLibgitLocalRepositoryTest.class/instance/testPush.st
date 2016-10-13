tests
testPush
	repository := IceRepository origin: 'git@github.com:npasserini/pharo-git-test.git'.
	self assert: repository backend class equals: IceLibgitLocalRepository.

	self scenarioOutgoingCommit.
	repository push
