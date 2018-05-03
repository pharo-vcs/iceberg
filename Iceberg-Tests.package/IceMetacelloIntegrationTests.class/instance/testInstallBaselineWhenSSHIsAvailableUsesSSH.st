tests
testInstallBaselineWhenSSHIsAvailableUsesSSH

	"This test is meant to run on SSH when SSH is running only.
	Thus, CI is avoided"
	self isTestingSSH ifFalse: [ ^ self skip ].
	self isCI ifTrue: [ ^ self skip ].

	self installBaseline.
	repository := self repositoryForTest.
		
	self assert: (repository origin url beginsWith: 'git@')