testing
isOkEnabled
	
	^ self username isNotEmpty and: [ self publicKey isNotEmpty and: [ self privateKey isNotEmpty ] ]