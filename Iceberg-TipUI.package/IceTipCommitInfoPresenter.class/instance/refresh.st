accessing
refresh
	selectedModel ifNotNil: [ self showInfoTabs ] ifNil: [ self showEmptyTab ]