operations
commitWithMessage: aString 
	
	
	^ self
		commitPackages: self modifiedPackages
		withMessage: aString