tests
testConflictDetectedWithProjectWithDependency

	Metacello new
		baseline: 'PharoGitTest';
		repository:'github://pharo-vcs/test-project-source-properties-tonel';
		load.

	self assert: self repositoryForTest head description equals: 'master'.
	self assert: (Smalltalk classNamed: #Test) new versionNumber equals: 700.

	self should: [Metacello new
		baseline: 'TestProjectWithDep';
		repository:'github://pharo-vcs/test-project-with-dep';
		load] raise: MetacelloConflictingProjectError.
			