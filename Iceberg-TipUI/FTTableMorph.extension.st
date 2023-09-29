Extension { #name : 'FTTableMorph' }

{ #category : '*Iceberg-TipUI' }
FTTableMorph >> selectFirstVisibleRow [
	^ self
		selectIndex:
			(container exposedRows
				ifNotEmpty: [ :rows | rows keys first ]
				ifEmpty: [ 0 ])
]

{ #category : '*Iceberg-TipUI' }
FTTableMorph >> useFunction: aFilterFunctionClass do: aBlock [ 
	function := aFilterFunctionClass table: self.
	aBlock cull: function cull: self
]
