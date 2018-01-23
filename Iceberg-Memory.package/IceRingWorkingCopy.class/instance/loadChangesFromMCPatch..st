private-monticello
loadChangesFromMCPatch: aPatch
	
	aPatch mergedSnapshot definitions
		select: [ :each | each isOrganizationDefinition ]
		thenDo: [ :each | each categories
				do: [ :categoryName | 
					self packages
						detect: [ :package | categoryName beginsWith: package name ]
						ifFound: [ :package | 
							(ringEnvironment ensurePackageNamed: package name)
								addClassTag: categoryName ]
						ifNone: [ ringEnvironment ensurePackageNamed: categoryName ] ] ].

	aPatch mergedSnapshot definitions
		select: [ :each | each isClassDefinition ]
		thenDo: [ :each | | package |
			package := self packages detect: [ :icePackage | each category beginsWith: icePackage name ].
			self createClass: each className inPackage: package name superclass: each superclassName ].
	
	aPatch mergedSnapshot definitions
		select: [ :each | each isMethodDefinition ]
		thenDo: [ :each | 
			self createMethod: each source inClass: each className ].