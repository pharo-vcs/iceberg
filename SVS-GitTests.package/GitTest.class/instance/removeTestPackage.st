auxiliar
removeTestPackage
	| package | 
	package := RPackageOrganizer default packageNamed: 'Pharo-Git-Test' ifAbsent: nil.
	package ifNotNil: [RPackageOrganizer default unregisterPackage: package]