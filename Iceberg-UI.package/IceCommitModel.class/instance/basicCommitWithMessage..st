private
basicCommitWithMessage: aString
	self repository 
		commitPackages: self model modifiedPackages
		withMessage: aString