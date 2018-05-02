tests
testNewRepositoryPackagesAreClean

	"Avoid this test if on ssh on the CI"
	(self isTestingSSH and: [ self isCI ])
		ifTrue: [ ^ self skip ].

	self installBaseline.
	repository := IceRepository registry
		detect: [ :e | e name = 'pharo-git-test' ].
		
	self assert: (repository workingCopy loadedPackages allSatisfy: [ :each | each isClean ])