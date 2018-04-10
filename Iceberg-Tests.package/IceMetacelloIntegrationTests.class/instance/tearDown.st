running
tearDown

	repository ifNotNil: [ :each |
		repository unload.
		each location ensureDeleteAll.
		each forget.
		(IceMetacelloRepositoryAdapter for: each) unregister ].

	(IceRepository registry 
		select: [:repo | repo origin url endsWith: 'pharo-git-test.git'])
		do: [ :repo | 
			repository unload.
			repo forget.
			repo location ensureDeleteAll ].

	"Cleanup Metacello registry to avoid conflicts"		
	(MetacelloProjectRegistration registry baselineRegistry
		detect: [ :registration | registration projectName = 'PharoGitTest' ])
			unregisterProject.

	super tearDown.

	