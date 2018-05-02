helpers
createTrait: traitName inPackage: packageName with: aBlock
	
	| package class |
	package := ringEnvironment ensurePackageNamed: packageName.
	class := ringEnvironment ensureTraitNamed: traitName.
	class package: package.
	"class tagWith: packageName."
	
	aBlock value: class.
	
	self markAsDirtyPackageNamed: package name