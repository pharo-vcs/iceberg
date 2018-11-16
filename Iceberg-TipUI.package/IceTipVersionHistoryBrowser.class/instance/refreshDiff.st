private
refreshDiff
	selectedModel ifNil: [ ^ self ].
	
	diffTab contents: (self 
		newDiffPanelLeft: ((self model commitModelAfter: selectedModel) 
			ifNotNil: #source
			ifNil: [ '' ] )
		right: selectedModel source)