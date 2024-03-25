Extension { #name : 'IceMethodDefinition' }

{ #category : '*Iceberg-TipUI' }
IceMethodDefinition >> browse [
	
	(self contextClass >> name) browse
]

{ #category : '*Iceberg-TipUI' }
IceMethodDefinition >> canBeBrowsed [
	
	^ self contextClass
		ifNotNil: [ :class | class includesSelector: name ]
		ifNil: [ false ]
]

{ #category : '*Iceberg-TipUI' }
IceMethodDefinition >> canBrowseReferences [
	
	^ false
]

{ #category : '*Iceberg-TipUI' }
IceMethodDefinition >> iconName [
	
	^ #changeUpdate
]
