private
try: aBlock onSuccess: successBlock
	^ self 
		try: aBlock 
		onSuccess: successBlock 
		onFailure: [ nil ]