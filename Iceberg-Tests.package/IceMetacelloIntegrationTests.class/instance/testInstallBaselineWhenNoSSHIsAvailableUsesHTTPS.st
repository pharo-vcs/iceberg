tests
testInstallBaselineWhenNoSSHIsAvailableUsesHTTPS

	"This test is meant to run in the CI using SSH, when SSH is not available.
	Other configurations make no sense for this test"
	self isTestingSSH ifFalse: [ ^ self skip ].
	self isCI ifFalse: [ ^ self skip ].

	self installBaseline.
	repository := IceRepository registry
		detect: [ :e | e name = 'pharo-git-test' ]
		ifNone: [ self fail ].
		
	self assert: repository origin url asUrl scheme equals: 'https'