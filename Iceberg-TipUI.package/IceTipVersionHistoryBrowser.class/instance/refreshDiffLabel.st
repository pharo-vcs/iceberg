private
refreshDiffLabel
	
	diffTab label: ('{1} to {2}' format: { 
		(self model commitModelAfter: selectedModel) 
			ifNotNil: #shortId
			ifNil: [ 'origin' ].
		selectedModel shortId })