building
doStrongSelection: aPresentation for: aContext
	CmdCommandStrongSelectionActivation
		activateAllInContext: aContext
		by: [ :each | 
			each command readParametersFromGlamourContext: (CmdGlamourActionContext new 
				presentation: aPresentation;
				yourself).
			each executeCommand ].	