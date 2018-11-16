private-impacting-changes
impactPackageChanges: anIcePackageDefinition currentNode: currentNode

	| visitor |
	
	anIcePackageDefinition categories do: [ :categoryName | 
		self packages
			detect: [ :package | categoryName beginsWith: package name ]
			ifFound: [ :package | 
				(self environment ensurePackageNamed: package name)
					addClassTag: categoryName ]
			ifNone: [ self environment ensurePackageNamed: categoryName ] ].
	
	visitor := IceRingWorkingCopyChangerVisitor on: self.
	currentNode childrenDo: [ :each | each accept: visitor ]	