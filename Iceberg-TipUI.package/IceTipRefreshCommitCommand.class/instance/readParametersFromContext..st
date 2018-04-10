execution
readParametersFromContext: aToolContext
	super readParametersFromContext: aToolContext.
	announcer := IceTipWeakValueHolder contents: aToolContext toolAnnouncer
	