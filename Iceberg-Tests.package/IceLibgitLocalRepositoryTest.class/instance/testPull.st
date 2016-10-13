tests
testPull
	repository pull.
	
	repository := IceRepository origin: 'ssh://github.com/npasserini/pharo-git-test.git'.
	self assert: repository backend class equals: IceLibgitLocalRepository.
	repository pull
