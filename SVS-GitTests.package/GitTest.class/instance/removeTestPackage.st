auxiliar
removeTestPackage
	| package | 
	package := RPackageOrganizer default packageNamed: 'Pharo-Git-Test' ifAbsent: nil.
	package ifNotNil: [
		package definedClasses do: #removeFromSystem.
		RPackageOrganizer default unregisterPackage: package		
	]