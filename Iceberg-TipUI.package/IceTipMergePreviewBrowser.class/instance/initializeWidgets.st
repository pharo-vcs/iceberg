initialization
initializeWidgets 
	super initializeWidgets.
	diffPanel leftLabel: 'Working Copy'.
	diffPanel rightLabel: 'Merge with ' , model targetName.
