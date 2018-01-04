tests
testSshUrl
	| remote |
	remote := IceGitRemote url: 'git@github.com:npasserini/pharo-git.git'.
	self assert: remote host equals: 'github.com'.
	self assert: remote owner equals: 'npasserini'.
	self assert: remote projectName equals: 'pharo-git'.