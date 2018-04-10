tests
installBaseline

	Metacello new
		baseline: 'PharoGitTest';
		repository: 'github://pharo-vcs/pharo-git-test:forBecomeWriteable';
		onUpgrade: [ :e | e useIncoming ];
		onConflict: [ :ex | ex allow ];
		load.