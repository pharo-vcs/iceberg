Extension { #name : 'MCModification' }

{ #category : '*Iceberg-Changes' }
MCModification >> asIceOperationOn: aNode diff: anIceDiff [ 
	
	^ MCModification
		of: aNode
		to: aNode
]

{ #category : '*Iceberg-Changes' }
MCModification >> myVersionOn: aDiff [

	^ aDiff versionFromDefinition: modification
]
