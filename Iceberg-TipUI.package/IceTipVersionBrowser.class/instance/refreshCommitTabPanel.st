private
refreshCommitTabPanel
	selectedModel 
		ifNotNil: [ self showInfoTabs ]
		ifNil: [ self showEmptyTab ]