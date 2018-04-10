execution
readParametersFromContext: aToolContext
	super readParametersFromContext: aToolContext.
	item := aToolContext item.
	announcer := IceTipWeakValueHolder contents: aToolContext toolAnnouncer