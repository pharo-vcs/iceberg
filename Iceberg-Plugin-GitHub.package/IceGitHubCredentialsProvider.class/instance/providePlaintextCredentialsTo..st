accessing
providePlaintextCredentialsTo: aCredentials 
	^ self credentials isPresent
		ifTrue: [ aCredentials readFrom: self credentials ]
		ifFalse: [ self obtainPlaintextCredentials: aCredentials ].
