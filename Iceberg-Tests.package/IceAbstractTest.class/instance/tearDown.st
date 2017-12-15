running
tearDown
	super tearDown. 
	
	self removeTestPackages.

	IceTestCredentialProvider uninstall.
	repository ifNotNil: [ :each |
		each forget.
		each location ensureDeleteAll ].

	(IceOldRepository registry 
		select: [:repo | repo origin url endsWith: 'pharo-git-test.git'])
		do: [ :repo | 
			repo forget.
			repo location ensureDeleteAll.
			Transcript logCr: ('Warning {1} left a registered repository' format: {self}) 
		]

	