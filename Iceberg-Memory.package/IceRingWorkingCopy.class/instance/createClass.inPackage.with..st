helpers
createClass: className inPackage: packageName with: aBlock
	
	| package class |
	package := ringEnvironment ensurePackageNamed: packageName.
	class := ringEnvironment ensureClassNamed: className.
	class package: package.
	"class tagWith: packageName."
	
	aBlock value: class.
	
	(self includesPackageNamed: packageName) ifFalse: [ ^ self ].
	self markAsDirtyPackageNamed: package name