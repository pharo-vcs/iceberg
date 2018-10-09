running
testScpUrlForSelfHostedGitlab

	| repository |

	(SystemVersion current major <= 6) ifTrue: [self skip].
	repository := MCGitlabRepository location: 'gitlab://git.pharo.org:pharo-project/pharo:master'.
	self assert: repository scpUrl equals: 'git@git.pharo.org:pharo-project/pharo.git'
