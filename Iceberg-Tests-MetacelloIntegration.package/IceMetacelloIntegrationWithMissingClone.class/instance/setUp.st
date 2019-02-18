tests
setUp

	super setUp.
	
	Metacello new
		baseline: 'PharoGitTest';
		repository:'github://pharo-vcs/test-project-source-properties-tonel';
		load.
		
	(IceRepository registry select: [ :e | e name = 'test-project-source-properties-tonel' ])
		do: [ :e | e location ensureDeleteAll ]

	