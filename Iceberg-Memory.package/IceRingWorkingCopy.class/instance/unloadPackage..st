private-monticello
unloadPackage: aPackage

	| package |
	package := ringEnvironment ask packageNamed: aPackage name.
	package ifNil: [ ^ self ].
	
	ringEnvironment removePackage: package.
	package classes do: [ :each | ringEnvironment removeBehavior: each ]