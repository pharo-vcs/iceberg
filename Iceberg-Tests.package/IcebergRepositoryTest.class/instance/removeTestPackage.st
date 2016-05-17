auxiliar
removeTestPackage
	MCWorkingCopy registry
		at: (MCPackage named: packageName)
		ifPresent: [ :wc | wc unload ]
