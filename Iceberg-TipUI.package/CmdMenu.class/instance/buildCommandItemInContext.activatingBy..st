building
buildCommandItemInContext: aToolContext activatingBy: anActivationStrategy

	| commandActivator group |
	commandActivator := anActivationStrategy newActivatorFor: aToolContext.
	
	group := self ensureGroup: anActivationStrategy menuGroup.
	group addItem: (CmdCommandMenuItem activatingBy: commandActivator)