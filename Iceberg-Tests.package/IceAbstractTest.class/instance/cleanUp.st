running
cleanUp
	self removeTempDirectories.
	self removeTestPackages.

	(IceRepository registry 
		select: [:repo | repo origin url endsWith: projectName, '.git'])
		do: [ :repo | 
			repo forget.
			Transcript logCr: ('Warning {1} left a registered repository' format: {self}) 
		]
