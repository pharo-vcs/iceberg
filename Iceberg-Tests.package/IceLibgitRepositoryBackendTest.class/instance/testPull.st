tests
testPull
	repository := IceRepository origin: 'git@github.com/npasserini/pharo-git-test.git'.
	self assert: repository backend class equals: IceLibgitRepositoryBackend.
	repository pull
