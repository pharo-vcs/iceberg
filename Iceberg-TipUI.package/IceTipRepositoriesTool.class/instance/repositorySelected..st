initialization
repositorySelected: ann
	| selection context |
	
	selection := repositoryList widget dataSource elementAt: ann selectedRowIndex.
	context := self newContext.
	context selection: selection.
	CmdCommandStrongSelectionActivation
		activateAllInContext: context
		by: [ :each | each executeCommand ].		
