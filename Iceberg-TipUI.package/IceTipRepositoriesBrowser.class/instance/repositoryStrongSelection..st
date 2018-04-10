private
repositoryStrongSelection: ann
	| selection context |
	
	selection := repositoryList widget dataSource elementAt: ann selectedRowIndex.
	context := self newContextWithSelection: selection.
	IceTipCommandStrongSelectionActivation
		activateAllInContext: context
		by: [ :each | each executeCommand ].		
