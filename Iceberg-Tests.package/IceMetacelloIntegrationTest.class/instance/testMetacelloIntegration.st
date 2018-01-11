tests - create repository
testMetacelloIntegration
	self assert: (IceRepository registry noneSatisfy: [ :repo | repo origin projectName = projectName ]).
	
	Metacello new
	  baseline: 'PharoGitTest';
	  repository: 'github://pharo-vcs/', projectName;
	  load.

	repository := IceRepository registry 
		detect: [ :repo | repo origin projectName = projectName ]
		ifNone: [ self fail: 'Could not find repository for project: ', projectName ].

	self assert: repository workingCopy workingCopyState isSingleCommitState.
	self assert: repository incomingCommits isEmpty.
	self assert: repository outgoingCommits isEmpty.
