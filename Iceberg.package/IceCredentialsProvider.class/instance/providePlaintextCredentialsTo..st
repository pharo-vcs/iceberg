as yet unclassified
providePlaintextCredentialsTo: credentials
	Transcript logCr: 'providing'.
	tries < 3 
		ifTrue: [ 
			tries := tries + 1.
			credentials username: 'iceberg-test'; passphrase: 'iceberg2016'.  
			Transcript logCr: 'provided'.
			]
		ifFalse: [ 
			self error: 'There where already three failed attempts, aborting'
		]