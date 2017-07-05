private requesting
getRaw: aString 
	^ self responseWithValidationDo: [
		(self newRequestTo: aString)
			get;
			response ]