private requesting
post: aString with: aBlock  
	^ self jsonContentsWithValidationDo: [
		(self newRequestTo: aString)
			in: aBlock;
			post;
			response ]