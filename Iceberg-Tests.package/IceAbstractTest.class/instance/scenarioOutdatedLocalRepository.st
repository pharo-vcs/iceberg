scenarios
scenarioOutdatedLocalRepository
	"Prepare 1 - Create an outdated local repository"
	self absoluteLocation ensureDeleteAll.
	IceGitCommand 
		in: self absoluteLocation parent
		execute: { 
			'clone'. 
			'https://github.com/pharo-vcs/{1}.git' format: { projectName }. 
			projectName }. 

	IceGitCommand in: self absoluteLocation execute: {'checkout forBecomeWriteable'}.
	IceGitCommand in: self absoluteLocation execute: {'reset --hard HEAD^'}.

	"Prepare 2 - Load project using metacello"
	self disablingMetacelloIntegrationDo: [
		Metacello new
			baseline: 'PharoGitTest';
			repository: 'github://pharo-vcs/pharo-git-test:forBecomeWriteable';
			onConflict: [:ex | ex allow];
			load
	].

	"Excercise"
	repository := IceRepositoryCreator new
		location: self absoluteLocation;
		branchName: 'forBecomeWriteable';
		createRepository.
		
	repository workingCopy adoptCommit: repository headCommit.