tests
testBitbucketSSHUrl

	| url |
	url := IceUrlBuilder new
		beSsh;
		beBitbucket;
		username: 'username' project: 'project';
		buildUrl.
	
	self assert: url equals: 'git@bitbucket.org:username/project.git'