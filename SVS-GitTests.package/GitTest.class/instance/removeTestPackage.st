auxiliar
removeTestPackage
	| workingCopy |
	workingCopy := MCWorkingCopy forPackage: (MCPackage named: packageName).
	workingCopy unload.
