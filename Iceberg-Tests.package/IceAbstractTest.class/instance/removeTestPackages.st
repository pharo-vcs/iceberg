auxiliar
removeTestPackages
	self getTestPackages do: [ :name |
		MCWorkingCopy registry
			at: (MCPackage named: name)
			ifPresent: [ :wc | wc unload ]]
