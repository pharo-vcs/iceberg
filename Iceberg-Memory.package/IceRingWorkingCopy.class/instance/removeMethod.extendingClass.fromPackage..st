helpers
removeMethod: selector extendingClass: aClassName fromPackage: aPackageName

	| method class |
	class := ringEnvironment ensureClassNamed: aClassName.
	method := class ask methodNamed: selector.
	class removeLocalMethod: method.
	self markAsDirtyPackageNamed: aPackageName.