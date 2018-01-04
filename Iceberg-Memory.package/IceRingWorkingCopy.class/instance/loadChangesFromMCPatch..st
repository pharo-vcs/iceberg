private-monticello
loadChangesFromMCPatch: aPatch
	
	aPatch mergedSnapshot definitions do: [ :each |
		each ensureRing2DefinitionIn: ringEnvironment ].

	aPatch mergedSnapshot definitions
		select: [ :each | each isClassDefinition ]
		thenDo: [ :each | each halt ].
	
	aPatch mergedSnapshot definitions
		select: [ :each | each isMethodDefinition ]
		thenDo: [ :each | each halt ].