tests - create repository
testMetacelloIntegrationForTags
	self assert: (IceRepository registry noneSatisfy: [ :repo | repo origin projectName = projectName ]).
	
	Metacello new
		baseline: 'PharoGitTest';
		repository: 'github://pharo-vcs/', projectName, ':1.2.3';
		onConflict: [ :e | e useIncoming ];
		load.

	repository := IceRepository registry 
		detect: [ :repo | repo origin projectName = projectName ]
		ifNone: [ self fail: 'Could not find repository for project: ', projectName ].

	self assert: repository workingCopy workingCopyState isSingleCommitState.
	self assert: repository head isDetached.
