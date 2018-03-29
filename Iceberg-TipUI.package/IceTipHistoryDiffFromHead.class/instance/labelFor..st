accessing
labelFor: aCommitModel
	^ 'HEAD to {1}' format: { aCommitModel ifNotNil: #shortId }