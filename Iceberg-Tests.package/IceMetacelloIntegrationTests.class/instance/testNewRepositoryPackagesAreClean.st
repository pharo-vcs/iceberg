tests
testNewRepositoryPackagesAreClean

	(Iceberg remoteTypeSelector = #scpUrl
		and: [ self isCI ]) ifTrue: [ ^ self skip ].

	repository := IceRepository registry
		detect: [ :e | e name = 'pharo-git-test' ].
		
	self assert: (repository workingCopy loadedPackages allSatisfy: [ :each | each isClean ])