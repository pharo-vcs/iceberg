running
testScpUrl

	| repository |

	repository := MCGitlabRepository location: 'gitlab://pharo-project/pharo:master'.
	self assert: repository scpUrl equals: 'git@gitlab.com:pharo-project/pharo.git'