tests
testBitbucketHttpsUrl

	| url |
	url := IceUrlBuilder new
		beHttps;
		beBitbucket;
		username: 'username' project: 'project';
		buildUrl.

	self assert: url equals: 'https://bitbucket.org/username/project.git'