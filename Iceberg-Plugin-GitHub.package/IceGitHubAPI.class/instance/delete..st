private requesting
delete: aString 
	^ self jsonContentsWithValidationDo: [
		(self newRequestTo: aString)
			delete;
			response ]