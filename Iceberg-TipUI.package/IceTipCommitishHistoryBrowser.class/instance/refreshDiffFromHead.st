private
refreshDiffFromHead
	selectedModel ifNil: [ ^ self ].
	diffFromHeadTab 
		contents: (IceTipDiffPanel diff: (selectedModel diffFromHead)) buildWithSpec