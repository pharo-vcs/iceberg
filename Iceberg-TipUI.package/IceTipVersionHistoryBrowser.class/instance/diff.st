private
diff
	
	selectedModel ifNil: [ ^ self ].
	^ self 
		newDiffPanelLeft: ((self model commitModelAfter: selectedModel) 
			ifNotNil: #source
			ifNil: [ '' ])
		right: selectedModel source