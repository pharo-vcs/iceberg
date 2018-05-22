helpers
removeMethod: selector fromClass: aClassName

	| class |
	class := ringEnvironment ensureClassNamed: aClassName.
	self basicRemoveMethod: selector fromClass: aClassName.
	self markAsDirtyPackageNamed: class package name.