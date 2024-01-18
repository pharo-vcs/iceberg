Extension { #name : 'IcePlaintextCredentials' }

{ #category : '*Iceberg-TipUI' }
IcePlaintextCredentials >> askForModelClass [
	^ IceTipAskForPlaintextCredentialsPresenter 
]

{ #category : '*Iceberg-TipUI' }
IcePlaintextCredentials >> askForModelClassOn: aString [

	^ (aString includesSubstring: 'github.com' caseSensitive: false) 
		ifTrue: [ IceTipAskGithubForPlaintextCredentialsPresenter ]
		ifFalse: [ self askForModelClass ]
]

{ #category : '*Iceberg-TipUI' }
IcePlaintextCredentials >> editModelClass [
	^ IceTipEditPlaintextCredentialsPresenter 
]
