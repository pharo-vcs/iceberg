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

	self assert: (repository loadedCode loadedVersions noneSatisfy: [ :version | version isKindOf: IceForeignVersion ]).
	self assert: ((repository loadedCode versionFor: (repository packageNamed: packageName)) isKindOf: IceSavedPackageVersion ).
	self assert: repository incomingCommits isEmpty.
	self assert: repository outgoingCommits isEmpty.
