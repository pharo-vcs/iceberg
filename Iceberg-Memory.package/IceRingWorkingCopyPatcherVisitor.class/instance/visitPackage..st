visiting
visitPackage: anIcePackageDefinition 
	
	anIcePackageDefinition categories do: [ :categoryName | 
		workingCopy packages
			detect: [ :package | categoryName beginsWith: package name ]
			ifFound: [ :package | 
				(workingCopy environment ensurePackageNamed: package name)
					addClassTag: categoryName ]
			ifNone: [ workingCopy environment ensurePackageNamed: categoryName ] ]