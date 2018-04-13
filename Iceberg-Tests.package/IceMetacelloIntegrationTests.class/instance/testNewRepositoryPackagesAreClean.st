tests
testNewRepositoryPackagesAreClean

	repository := IceRepository registry
		detect: [ :e | e name = 'pharo-git-test' ].
		
	self assert: (repository workingCopy loadedPackages allSatisfy: [ :each | each isClean ])