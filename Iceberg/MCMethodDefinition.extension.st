Extension { #name : 'MCMethodDefinition' }

{ #category : '*Iceberg-Adapters' }
MCMethodDefinition >> classCategory [
	^ self actualClass ifNotNil: #category ifNil: [ RPackage defaultPackageName ]

]

{ #category : '*Iceberg-Changes' }
MCMethodDefinition >> method [
	^ self actualClass >> self selector
]
