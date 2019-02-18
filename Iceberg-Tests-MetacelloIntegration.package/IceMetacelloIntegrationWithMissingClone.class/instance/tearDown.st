tests
tearDown

	super tearDown.
	
	(IceRepository registry select: [ :e | e name = 'test-project-with-dep' ]) do: [ :each | each ifNotNil: [ :repo |
		repo unload.
		repo forget.
		repo location ifNotNil: #ensureDeleteAll ] ].

	"Cleanup Metacello registry to avoid conflicts"		
	MetacelloProjectRegistration registry baselineRegistry
		detect: [ :registration | registration projectName = 'TestProjectWithDep' ]
		ifFound: [ :registration | registration unregisterProject ].
	