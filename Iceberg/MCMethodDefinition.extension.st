Extension { #name : 'MCMethodDefinition' }

{ #category : '*Iceberg-Changes' }
MCMethodDefinition >> buildOn: anIcePackageDiff [ 
	self shouldBeImplemented.
]

{ #category : '*Iceberg-Changes' }
MCMethodDefinition >> method [
	^ self actualClass >> self selector
]
