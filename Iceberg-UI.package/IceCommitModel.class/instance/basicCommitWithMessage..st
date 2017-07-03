private
basicCommitWithMessage: aString
	self repository 
		commitPackages: self model changedPackages
		withMessage: aString