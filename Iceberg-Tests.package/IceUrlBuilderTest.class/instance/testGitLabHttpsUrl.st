tests
testGitLabHttpsUrl

	| url |
	url := IceUrlBuilder new
		beHttps;
		beGitLab;
		username: 'username' project: 'project';
		buildUrl.

	self assert: url equals: 'https://gitlab.com/username/project.git'