tests - create repository
testMetacelloIntegration
	self assert: (IceRepository registry noneSatisfy: [ :repo | repo origin projectName = projectName ]).
	
	Metacello new
	  baseline: 'PharoGitTest';
	  repository: 'github://npasserini/', projectName;
	  load.

	repository := IceRepository registry 
		detect: [ :repo | repo origin projectName = projectName ]
		ifNone: [ self fail: 'Could not find repository for project: ', projectName ].

	self assert: (repository loadedCode loadedVersions allSatisfy: [ :version | version isKindOf: IceSavedPackageVersion ]).
	self assert: repository incommingCommits isEmpty.
	self assert: repository outgoingCommits isEmpty.
