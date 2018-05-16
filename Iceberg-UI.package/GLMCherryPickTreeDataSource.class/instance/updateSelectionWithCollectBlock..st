updating
updateSelectionWithCollectBlock: aBlock
	self table ifNil: [ ^ self ].
	super updateSelectionWithCollectBlock: aBlock