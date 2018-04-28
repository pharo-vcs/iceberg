tests
testGitLabSSHUrl

	| url |
	url := IceUrlBuilder new
		beSsh;
		beGitLab;
		username: 'username' project: 'project';
		buildUrl.
	
	self assert: url equals: 'git@gitlab.com:username/project.git'