Extension { #name : 'IceDefinition' }

{ #category : '*Iceberg-TipUI' }
IceDefinition >> icon [
	
	^ self iconNamed: self iconName
]

{ #category : '*Iceberg-TipUI' }
IceDefinition >> iconName [
	
	self subclassResponsibility
]
