private parsing
try: aBlock onFailure: failureBlock
	^ self 
		try: aBlock 
		onSuccess: [ :parsedValue |  parsedValue ] 
		onFailure: failureBlock