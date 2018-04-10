utilities
removeClassNamed: aString 
	
	| class method |
	class := ringEnvironment ask classNamed: aString.
	method := ringEnvironment removeBehavior: class.
	self markAsDirtyPackageNamed: class package name.