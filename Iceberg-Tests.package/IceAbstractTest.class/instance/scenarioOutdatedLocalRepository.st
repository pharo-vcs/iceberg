scenarios
scenarioOutdatedLocalRepository
	"Prepare 1 - Create an outdated local repository"
	self absoluteLocation ensureDeleteAll.
	IceGitCommand 
		in: self absoluteLocation parent
		execute: { 
			'clone'. 
			'https://github.com/npasserini/{1}.git' format: { projectName }. 
			projectName }. 

	IceGitCommand in: self absoluteLocation execute: {'checkout forBecomeWriteable'}.
	IceGitCommand in: self absoluteLocation execute: {'reset --hard HEAD^'}.

	"Prepare 2 - Load project using metacello"
	self disablingMetacelloIntegrationDo: [
		Metacello new
		  baseline: 'PharoGitTest';
		  repository: 'github://npasserini/pharo-git-test:forBecomeWriteable';
		  load
	].

	"Excercise"
	repository := IceRepositoryCreator new
		url: self scpOriginUrl;
		location: self absoluteLocation;
		branchName: 'forBecomeWritable';
		createRepository
