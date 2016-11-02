initialization
initialize
	model := nil asValueHolder.
	model whenChangedDo: [ :diff | commitButton label: 'Commit onto ', diff repository branch name ].
	super initialize