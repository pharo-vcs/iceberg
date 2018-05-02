running
tearDown

	{ repository . conflictingRepository } do: [ :each | each ifNotNil: [ :repo |
		repo unload.
		repo forget.
		repo location ifNotNil: #ensureDeleteAll.
		(IceMetacelloRepositoryAdapter for: repo) unregister ] ].

	(IceRepository registry 
		select: [:repo | 
			repo isMissing not and: [ repo origin url endsWith: 'pharo-git-test.git' ]])
		do: [ :repo | 
			repo unload.
			repo forget.
			repo location ensureDeleteAll.
			(IceMetacelloRepositoryAdapter for: repo) unregister ].
		

	"Cleanup Metacello registry to avoid conflicts"		
	MetacelloProjectRegistration registry baselineRegistry
		detect: [ :registration | registration projectName = 'PharoGitTest' ]
		ifFound: [ :registration | registration unregisterProject ].

	"Remove temporary repository just in case"
	'temp/test' asFileReference ensureDeleteAll.

	super tearDown.

	