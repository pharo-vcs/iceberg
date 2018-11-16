tests
testGitHubHttpsUrl

	| url |
	url := IceUrlBuilder new
		beHttps;
		beGithub;
		username: 'username' project: 'project';
		buildUrl.

	self assert: url equals: 'https://github.com/username/project.git'