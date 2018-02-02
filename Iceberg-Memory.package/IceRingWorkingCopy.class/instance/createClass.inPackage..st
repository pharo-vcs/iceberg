helpers
createClass: className inPackage: packageName
	
	| package class |
	package := ringEnvironment ensurePackageNamed: packageName.
	class := ringEnvironment ensureClassNamed: className.
	class superclass name: 'Object'.
	class package: package.
	class tagWith: packageName.
	
	dirtyPackages add: packageName.