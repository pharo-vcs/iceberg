building
ensureMethodOwnerNamed: aString isMeta: aBoolean
	
	| definition |
	definition := sourceSnapshot definitionForMethodContainerNamed: aString ifAbsent: [ nil ].
	^ definition
		ifNil: [ self ensureExtensionNamed: aString isMeta: aBoolean ]
		ifNotNil: [ 
			definition isTraitDefinition
				ifTrue: [ self ensureTraitNamed: aString isMeta: aBoolean ]
				ifFalse: [ self ensureClassNamed: aString isMeta: aBoolean ] ]