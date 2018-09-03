helpers
createMethod: source extendingClass: aClassName inPackage: packageName
	
	| class method package |
	package := ringEnvironment ensurePackageNamed: packageName.
	class := ringEnvironment ensureClassNamed: aClassName.
	method := class ensureLocalMethodNamed: (RBParser parseMethod: source) selector.
	method protocol: '*', packageName.
	method sourceCode: source.
	method package: method parent package.
	method package: package.
	
	(self includesPackageNamed: packageName) ifFalse: [ ^ self ].
	self markAsDirtyPackageNamed: packageName.