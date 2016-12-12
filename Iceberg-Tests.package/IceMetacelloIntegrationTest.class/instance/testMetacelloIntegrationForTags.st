tests - create repository
testMetacelloIntegrationForTags
	self assert: (IceRepository registry noneSatisfy: [ :repo | repo origin projectName = projectName ]).
	
	Metacello new
	  baseline: 'PharoGitTest';
	  repository: 'github://npasserini/', projectName, ':1.2.3';
	  load.

	repository := IceRepository registry 
		detect: [ :repo | repo origin projectName = projectName ]
		ifNone: [ self fail: 'Could not find repository for project: ', projectName ].

	self assert: (repository loadedCode loadedVersions noneSatisfy: [ :version | version isKindOf: IceForeignVersion ]).
	self assert: ((repository loadedCode versionFor: (repository packageNamed: packageName)) isKindOf: IceSavedPackageVersion ).
	self assert: repository incomingCommits isEmpty.
	self assert: repository outgoingCommits isEmpty.
	
	repository loadedPackages do: [ :package | 
		self assert: package incomingCommits isEmpty.
		self assert: package outgoingCommits isEmpty 
	].
