private-monticello
loadChangesFromMCPatch: aPatch
	
	| snapshot |
	snapshot := aPatch mergedSnapshot.
	snapshot definitions
		select: [ :each | each isOrganizationDefinition ]
		thenDo: [ :each | each categories
				do: [ :categoryName | 
					self packages
						detect: [ :package | categoryName beginsWith: package name ]
						ifFound: [ :package | 
							(ringEnvironment ensurePackageNamed: package name)
								addClassTag: categoryName ]
						ifNone: [ ringEnvironment ensurePackageNamed: categoryName ] ] ].

	snapshot definitions
		select: [ :each | each isClassDefinition ]
		thenDo: [ :each | | package |
			package := self packages detect: [ :icePackage | each category beginsWith: icePackage name ].
			self createClass: each className inPackage: package name superclass: each superclassName ].
	
	snapshot definitions
		select: [ :each | each isMethodDefinition ]
		thenDo: [ :each | 
			self createMethod: each source inClass: each className ].