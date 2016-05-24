accessing
packageNamed: aString ifPresent: aBlockClosure 
	| package |
	package := RPackageOrganizer default packageNamed: aString ifAbsent: [ ^ nil ].
	aBlockClosure cull: package.