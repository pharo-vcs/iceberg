Extension { #name : 'IceMethodContainerDefinition' }

{ #category : '*Iceberg-TipUI' }
IceMethodContainerDefinition >> actualClass [
	
	| actualClass |
	actualClass := Smalltalk globals at: name.
	^ isMeta ifTrue: [ actualClass classSide ] ifFalse: [ actualClass ]
]

{ #category : '*Iceberg-TipUI' }
IceMethodContainerDefinition >> browse [
	
	| browsed |
	browsed := Smalltalk globals at: name.
	browsed isMeta ifTrue: [ browsed classSide ].
	browsed browse
]

{ #category : '*Iceberg-TipUI' }
IceMethodContainerDefinition >> canBeBrowsed [
	
	^ Smalltalk globals includesKey: name
]

{ #category : '*Iceberg-TipUI' }
IceMethodContainerDefinition >> canBrowseReferences [
	
	^ self canBeBrowsed
]
