running
tearDown
	self removeTestPackages.
	
	repository ifNotNil: #forget.
	self assert: (IceRepository registry noneSatisfy: [:repo | repo origin url endsWith: 'pharo-git-test.git'])

		