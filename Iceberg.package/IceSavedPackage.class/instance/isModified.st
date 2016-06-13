querying
isModified
	^ (self package
			changesIn: IceCommitish image
			comparedToBase: self repository headCommitish) 
		notEmpty 