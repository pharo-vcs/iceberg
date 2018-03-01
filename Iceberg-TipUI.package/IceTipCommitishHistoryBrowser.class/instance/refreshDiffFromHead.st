private
refreshDiffFromHead
	selectedModel ifNil: [ ^ self ].
	diffFromHeadTab 
		contents: (IceTipDiffPanel on: (selectedModel diffFromHead)) buildWithSpec