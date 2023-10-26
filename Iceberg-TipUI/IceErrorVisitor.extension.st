Extension { #name : 'IceErrorVisitor' }

{ #category : '*Iceberg-TipUI' }
IceErrorVisitor >> visitExperimentalFeature: aWarning [
	
	"By default experimental features are just accepted when we are not in an interactive mode".
	aWarning resume
]

{ #category : '*Iceberg-TipUI' }
IceErrorVisitor >> visitNoCommitMessage: aWarning [
	self visitGenericError: aWarning
]
