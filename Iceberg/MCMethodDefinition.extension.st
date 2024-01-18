Extension { #name : 'MCMethodDefinition' }

{ #category : '*Iceberg-Changes' }
MCMethodDefinition >> method [
	^ self actualClass >> self selector
]
