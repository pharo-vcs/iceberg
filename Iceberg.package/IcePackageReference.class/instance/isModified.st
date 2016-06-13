accessing
isModified
	^ (self 
		changesIn: IceCommitish image
		comparedToBase: self repository headCommitish) 
		notEmpty 