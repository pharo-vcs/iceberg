tests
testProjectHasDescriptor

	"Avoid this test if on ssh on the CI"
	(self isTestingSSH and: [ self isCI ])
		ifTrue: [ ^ self skip ].
	
	self installBaseline.
	repository := self repositoryForTest.

	self assert: repository project isUnborn equals: self hasProject not.