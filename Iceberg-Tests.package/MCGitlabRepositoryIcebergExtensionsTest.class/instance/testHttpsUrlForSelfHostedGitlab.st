running
testHttpsUrlForSelfHostedGitlab

	| repository |

	repository := MCGitlabRepository location: 'gitlab://git.pharo.org:pharo-project/pharo:master'.
	self assert: repository httpsUrl equals: 'https://git.pharo.org/pharo-project/pharo.git'