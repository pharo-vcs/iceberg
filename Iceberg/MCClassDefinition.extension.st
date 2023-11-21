Extension { #name : 'MCClassDefinition' }

{ #category : '*Iceberg' }
MCClassDefinition >> fullDefinitionString [
	^ String streamContents: [:stream | 
		self printDefinitionOn: stream.
		stream cr; cr.
		stream << self comment ]
]

{ #category : '*Iceberg-Changes' }
MCClassDefinition >> removeMetaSideVariables [
	
	variables := variables reject: [ :e | e isClassInstanceVariable ].

]
