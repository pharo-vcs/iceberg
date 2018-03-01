private
refreshDiffFromAncestor
	selectedModel ifNil: [ ^ self ].
	diffFromAncestorTab 
		contents: (IceTipDiffPanel on: (selectedModel diffFromAncestor)) buildWithSpec