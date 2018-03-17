private
refreshDiffFromHeadLabel
	diffFromHeadTab label: ('HEAD to {1}' format: { 
		selectedModel ifNotNil: #shortId }).