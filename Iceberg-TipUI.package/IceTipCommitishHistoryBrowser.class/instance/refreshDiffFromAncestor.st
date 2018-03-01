private
refreshDiffFromAncestor
	selectedModel ifNil: [ ^ self ].
	diffFromAncestorTab 
		contents: (IceTipDiffPanel diff: (selectedModel diffFromAncestor)) buildWithSpec