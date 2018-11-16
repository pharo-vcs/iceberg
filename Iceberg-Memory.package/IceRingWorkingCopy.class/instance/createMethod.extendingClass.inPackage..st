helpers
createMethod: source extendingClass: aClassName inPackage: packageName
	
	| class method package |
	package := ringEnvironment ensurePackageNamed: packageName.
	class := ringEnvironment ensureClassNamed: aClassName.
	method := class ensureLocalMethodNamed: (RBParser parseMethod: source) selector.
	method protocol: '*', packageName.
	method sourceCode: source.
	method package: package.
	self markAsDirtyPackageNamed: packageName.