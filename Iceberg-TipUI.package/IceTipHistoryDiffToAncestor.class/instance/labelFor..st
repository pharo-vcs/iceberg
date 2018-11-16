accessing
labelFor: aCommitModel
	^ '{1} to {2}' format: { 
		aCommitModel shortId.
		aCommitModel ancestorShortIdOrOrigin }