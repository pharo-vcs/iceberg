running
testScpUrlForSelfHostedGitlab

	| repository |

	repository := MCGitlabRepository location: 'gitlab://git.pharo.org:pharo-project/pharo:master'.
	self assert: repository scpUrl equals: 'git@git.pharo.org:pharo-project/pharo.git'