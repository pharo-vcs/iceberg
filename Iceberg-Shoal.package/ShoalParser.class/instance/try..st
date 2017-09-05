private parsing
try: aBlock
	^ self 
		try: aBlock 
		onSuccess: [ :parsedValue | parsedValue ] 
		onFailure: [ nil ]