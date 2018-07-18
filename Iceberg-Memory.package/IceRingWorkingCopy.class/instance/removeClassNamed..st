private-impacting-changes
removeClassNamed: aString 
	
	| class |
	class := ringEnvironment ask classNamed: aString.
	class ifNil: [ ^ self ].
	
	ringEnvironment removeBehavior: class.
	self markAsDirtyPackageNamed: class package name.