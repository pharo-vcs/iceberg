building
ensureMethodOwnerNamed: aString isMeta: aBoolean leftSnapshot: leftSnapshot rightSnapshot: rightSnapshot
	
	^ changesDictionary at: aString ifAbsent: [ | definition |
		definition := leftSnapshot definitionForMethodContainerNamed: aString ifAbsent: [ nil ].
		definition
			ifNil: [ self ensureExtensionNamed: aString isMeta: aBoolean ]
			ifNotNil: [ 
				definition isTraitDefinition
					ifTrue: [ self ensureTraitNamed: aString isMeta: aBoolean ]
					ifFalse: [ self ensureClassNamed: aString isMeta: aBoolean ] ] ]