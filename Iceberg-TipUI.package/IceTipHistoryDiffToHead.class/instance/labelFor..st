accessing
labelFor: aCommitModel
	^ '{1} to HEAD' format: { aCommitModel ifNotNil: #shortId }