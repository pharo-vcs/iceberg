running
testHttpsUrl

	| repository |

	repository := MCGitlabRepository location: 'gitlab://pharo-project/pharo:master'.
	self assert: repository httpsUrl equals: 'https://gitlab.com/pharo-project/pharo.git'