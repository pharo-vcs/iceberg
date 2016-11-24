tests - create repository
testImportOutdatedLocalRepository
	"Prepare 1 - Create an outdated local repository"
	IceGitCommand 
		in: self absoluteLocation parent
		execute: { 
			'clone'. 
			'https://github.com/npasserini/{1}.git' format: { projectName }. 
			projectName }. 

	Transcript cr; tab; show: 'HEAD '; show: ((IceGitCommand in: self absoluteLocation execute: 'rev-parse HEAD') first: 7); cr.
	IceGitCommand in: self absoluteLocation execute: {'checkout forBecomeWriteable'}.
	Transcript cr; tab; show: 'HEAD '; show: ((IceGitCommand in: self absoluteLocation execute: 'rev-parse HEAD') first: 7); cr.
	IceGitCommand in: self absoluteLocation execute: {'reset --hard HEAD^'}.
	Transcript cr; tab; show: 'HEAD '; show: ('HEAD^ ', ((IceGitCommand in: self absoluteLocation execute: 'rev-parse HEAD') first: 7)); cr.

	"Prepare 2 - Load project using metacello"
	self disablingMetacelloIntegrationDo: [
		Metacello new
		  baseline: 'PharoGitTest';
		  repository: 'github://npasserini/pharo-git-test';
		  load
	].

	Transcript cr; tab; show: 'MC '; show: (MCRepository fromUrl: 'github://npasserini/pharo-git-test') repositoryVersionString; cr.

	"Excercise"
	repository := IceRepository origin: origin location: self absoluteLocation.

	"Assert"
	self assert: repository branch name equals: 'forBecomeWriteable'.

	Transcript cr; tab; show: 'REPO '; show: repository headCommit id; cr.
	Transcript cr; tab; show: 'INCOMMING '; show: (repository incommingCommits collect: #id) asArray; cr.

	self assert: (IceRepositoryModel modelFor: repository) status equals: '1 incomming'.
	self assert: repository incommingCommits size equals: 1
