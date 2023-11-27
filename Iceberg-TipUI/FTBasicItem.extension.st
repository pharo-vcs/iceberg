Extension { #name : 'FTBasicItem' }

{ #category : '*Iceberg-TipUI' }
FTBasicItem >> toggle [
	self isExpanded
		ifTrue: [ self collapseAndRefresh ]
		ifFalse: [ self expandAndRefresh ]
]
