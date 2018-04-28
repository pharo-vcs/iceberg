tests
testGitHubSSHUrl

	| url |
	url := IceUrlBuilder new
		beSsh;
		beGithub;
		username: 'username' project: 'project';
		buildUrl.
	
	self assert: url equals: 'git@github.com:username/project.git'