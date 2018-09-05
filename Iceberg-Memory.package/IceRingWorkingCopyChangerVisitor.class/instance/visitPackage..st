visiting
visitPackage: anIcePackageDefinition 
	
	| visitor |
		
	anIcePackageDefinition categories do: [ :categoryName | 
		self workingCopy packages
			detect: [ :package | categoryName beginsWith: package name ]
			ifFound: [ :package | 
				(self environment ensurePackageNamed: package name)
					addClassTag: categoryName ]
			ifNone: [ self environment ensurePackageNamed: categoryName ] ].
	
	visitor := IceRingWorkingCopyChangerVisitor on: self workingCopy.
	currentNode childrenDo: [ :each | each accept: visitor ]	