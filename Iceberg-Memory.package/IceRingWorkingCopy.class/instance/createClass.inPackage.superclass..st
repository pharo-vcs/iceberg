helpers
createClass: className inPackage: packageName superclass: aSuperclass
	
	| package class |
	package := ringEnvironment ensurePackageNamed: packageName.
	class := ringEnvironment ensureClassNamed: className.
	class superclass name: aSuperclass.
	class package: package.
	class tagWith: packageName.
	
	self markPackageDirty: package