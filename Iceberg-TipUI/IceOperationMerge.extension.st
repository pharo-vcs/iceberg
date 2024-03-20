Extension { #name : 'IceOperationMerge' }

{ #category : '*Iceberg-TipUI' }
IceOperationMerge >> icon [

	^ self iconNamed: self iconName
]

{ #category : '*Iceberg-TipUI' }
IceOperationMerge >> iconName [

	self isRightChosen ifTrue: [ ^ #changeBlock ].
	self isLeftChosen ifTrue: [ ^ #forward ].
	
	^ self operationIconName
]

{ #category : '*Iceberg-TipUI' }
IceOperationMerge >> operationIconName [
	self subclassResponsibility
]
