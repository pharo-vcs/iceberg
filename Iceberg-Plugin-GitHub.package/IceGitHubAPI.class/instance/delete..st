private requesting
delete: aString 
	^ self contentsWithValidationDo: [
		(self newRequestTo: aString)
			delete;
			response ]