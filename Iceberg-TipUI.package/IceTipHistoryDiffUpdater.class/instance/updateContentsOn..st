updating
updateContentsOn: aCommitModel
	aCommitModel ifNil: [ ^ self ].
	self tab contents: (self newDiffPanelFor: (self diffFor: aCommitModel)) buildWithSpec