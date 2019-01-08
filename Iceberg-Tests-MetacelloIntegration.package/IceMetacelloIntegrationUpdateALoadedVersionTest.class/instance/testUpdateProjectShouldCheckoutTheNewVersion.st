tests
testUpdateProjectShouldCheckoutTheNewVersion

	Metacello new
		baseline: 'PharoGitTest';
		repository:'github://pharo-vcs/test-project-source-properties-tonel';
		load.

	self assert: self repositoryForTest head description equals: 'master'.
	self assert: (Smalltalk classNamed: #Test) new versionNumber equals: 700.

	Metacello new
		baseline: 'PharoGitTest';
		repository:'github://pharo-vcs/test-project-source-properties-tonel:1.2.3';
		onConflictUseIncoming;
		load.
		
	self assert: self repositoryForTest head description equals: '1.2.3'.
	self assert: (Smalltalk classNamed: #Test) new versionNumber equals: 697.
