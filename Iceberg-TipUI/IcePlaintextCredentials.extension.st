Extension { #name : #IcePlaintextCredentials }

{ #category : #'*Iceberg-TipUI' }
IcePlaintextCredentials >> askForModelClass [
	^ IceTipAskForPlaintextCredentialsModel 
]

{ #category : #'*Iceberg-TipUI' }
IcePlaintextCredentials >> askForModelClassOn: aString [

	^ (aString includesSubstring: 'github.com' caseSensitive: false) 
		ifTrue: [ IceTipAskGithubForPlaintextCredentialsModel ]
		ifFalse: [ self askForModelClass ]
]

{ #category : #'*Iceberg-TipUI' }
IcePlaintextCredentials >> editModelClass [
	^ IceTipEditPlaintextCredentialsModel 
]
