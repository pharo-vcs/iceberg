private-impacting-changes
removeClassNamed: aString 
	
	| class |
	class := ringEnvironment ask classNamed: aString.
	ringEnvironment removeBehavior: class.
	self markAsDirtyPackageNamed: class package name.