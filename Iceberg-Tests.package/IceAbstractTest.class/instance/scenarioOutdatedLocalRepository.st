scenarios
scenarioOutdatedLocalRepository
	"Prepare 1 - Create an outdated local repository"
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
		  repository: 'github://npasserini/pharo-git-test';
		  load
	].

	"Excercise"
	repository := IceRepository origin: origin location: self absoluteLocation.
