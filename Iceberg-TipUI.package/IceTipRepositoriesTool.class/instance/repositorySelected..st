initialization
repositorySelected: ann
	| selection context |
	
	selection := repositoryList widget dataSource elementAt: ann selectedRowIndex.
	context := self newContextWithSelection: selection.
	CmdCommandStrongSelectionActivation
		activateAllInContext: context
		by: [ :each | each executeCommand ].		
