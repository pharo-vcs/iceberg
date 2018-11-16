visiting
ensureMethodOwnerNamed: ownerName isMeta: isMeta isTrait: isTrait isExtension: isExtension
	
	| newDefinition |	
	newDefinition := isExtension
		ifTrue: [ IceExtensionDefinition named: ownerName isMeta: isMeta ]
		ifFalse: [ 
			isTrait
				ifFalse: [ IceClassDefinition named: ownerName isMeta: isMeta ]
				ifTrue: [ IceTraitDefinition named: ownerName isMeta: isMeta ] ].
	
	^ packageNode childAt: newDefinition key ifAbsentPut: [ newDefinition ].