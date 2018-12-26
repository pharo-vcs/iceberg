running
testScpUrlForSelfHostedGitlabWithNonDefaultSSHPort
	| repository |
	SystemVersion current major <= 6 ifTrue: [ self skip ].

	repository := MCGitlabRepository location: 'gitlab://git.pharo.org:1234:pharo-project/pharo'.
	self assert: repository scpUrl equals: 'ssh://git@git.pharo.org:1234/pharo-project/pharo.git'