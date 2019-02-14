private
repositoryStrongSelection: ann
	| selection context |

	selection := repositoryList widget dataSource
		elementAt: ann selectedIndex.
	context := self newContextWithSelection: selection.
	IceTipCommandStrongSelectionActivation
		activateAllInContext: context
		by: [ :each | each executeCommand ]