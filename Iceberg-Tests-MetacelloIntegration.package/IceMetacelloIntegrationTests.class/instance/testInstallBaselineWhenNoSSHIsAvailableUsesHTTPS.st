tests
testInstallBaselineWhenNoSSHIsAvailableUsesHTTPS

	"This test is meant to run in the CI using SSH, when SSH is not available.
	Other configurations make no sense for this test"
	self isTestingSSH ifTrue: [ ^ self skip ].

	self installBaseline.
	repository := self repositoryForTest.
		
	self assert: repository origin url asUrl scheme equals: 'https'