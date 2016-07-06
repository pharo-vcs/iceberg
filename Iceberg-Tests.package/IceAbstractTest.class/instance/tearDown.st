running
tearDown
	self removeTestPackage.
	repository forget.
	self assert: (IceRepository registry noneSatisfy: [:repo | repo origin url endsWith: 'pharo-git-test.git'])
