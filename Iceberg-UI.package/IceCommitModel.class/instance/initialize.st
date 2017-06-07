initialization
initialize
	model := nil asValueHolder.
	model whenChangedDo: [ :diff | commitButton label: 'Commit onto ', diff repository branchName ].
	model whenChangedDo: [ :diff | commitPushButton label: 'Commit and Push onto ', diff repository branchName ].
	super initialize