accessing
refresh
	
	selectedModel ifNil: [ ^ self ].
	
	headPage title: (headTabContainer labelFor: selectedModel).
	ancestorPage title: (ancestorTabContainer labelFor: selectedModel).
	notebookPanel resetAllPageContents