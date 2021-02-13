Extension { #name : #IceErrorVisitor }

{ #category : #'*Iceberg-TipUI' }
IceErrorVisitor >> visitNoCommitMessage: aWarning [
	self visitGenericError: aWarning
]
