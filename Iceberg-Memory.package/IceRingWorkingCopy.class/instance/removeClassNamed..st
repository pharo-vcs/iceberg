private-impacting changes
removeClassNamed: aString 
	
	| class |
	class := ringEnvironment ask behaviorNamed: aString ifAbsent: [ ^ self ].
	ringEnvironment removeBehavior: class.
	self markAsDirtyPackageNamed: class package name.