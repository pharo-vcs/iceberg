tests
testInstallingAMetacelloBaselineCreatesAnIcebergRepository

	Metacello new
		baseline: 'PharoGitTest';
		repository: 'github://pharo-vcs/pharo-git-test';
		onUpgrade: [ :e | e useIncoming ];
		onConflict: [ :ex | ex allow ];
		load.
	repository := IceRepository registry
		detect: [ :e | e name = 'pharo-git-test' ]
		ifNone: [ self fail ].