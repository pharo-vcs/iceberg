Extension { #name : 'MCPatchOperation' }

{ #category : '*Iceberg-Changes' }
MCPatchOperation >> asIceOperationOn: aNode diff: anIceDiff [
	
	^ MCAddition of: aNode
]

{ #category : '*Iceberg-Changes' }
MCPatchOperation >> myVersionOn: aDiff [
	
	self subclassResponsibility
]
