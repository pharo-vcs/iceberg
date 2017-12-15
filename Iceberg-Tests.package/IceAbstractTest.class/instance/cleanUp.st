running
cleanUp
	self removeTempDirectories.
	self removeTestPackages.

	(IceOldRepository registry 
		select: [:repo | repo origin url endsWith: projectName, '.git'])
		do: [ :repo | 
			repo forget.
			repo location ensureDeleteAll.
			Transcript logCr: ('Warning {1} left a registered repository' format: {self}) ].
