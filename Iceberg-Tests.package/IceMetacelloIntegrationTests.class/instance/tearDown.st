running
tearDown

	repository ifNotNil: [ :each |
		repository unload.
		each forget.
		each location ensureDeleteAll.
		(IceMetacelloRepositoryAdapter for: each) unregister ].

	(IceRepository registry 
		select: [:repo | repo origin url endsWith: 'pharo-git-test.git'])
		do: [ :repo | 
			repository unload.
			repo forget.
			repo location ensureDeleteAll.
			(IceMetacelloRepositoryAdapter for: repo) unregister ].
		

	"Cleanup Metacello registry to avoid conflicts"		
	(MetacelloProjectRegistration registry baselineRegistry
		detect: [ :registration | registration projectName = 'PharoGitTest' ])
			unregisterProject.

	super tearDown.

	