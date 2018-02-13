running
cleanUp
	self removeTempDirectories.
	self removeTestPackages.

	(IceRepository registry 
		select: [:repo | repo name = projectName ])
		do: [ :repo | 
			repo forget.
			repo location ensureDeleteAll.
			Transcript logCr: ('Warning {1} left a registered repository' format: {self}) ].
