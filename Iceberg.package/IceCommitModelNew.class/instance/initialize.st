initialization
initialize
	model := nil asValueHolder.
	model whenChangedDo: [ commitButton label: 'Commit onto branch ', self branchName ].
	super initialize