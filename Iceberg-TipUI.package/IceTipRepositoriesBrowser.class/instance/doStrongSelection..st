building
doStrongSelection: aPresentation
	CmdCommandStrongSelectionActivation
		activateAllInContext: IceTipRepositoryListContext new
		by: [ :each | 
			each command readParametersFromGlamourContext: (CmdGlamourActionContext new 
				presentation: aPresentation;
				yourself).
			each executeCommand ].	