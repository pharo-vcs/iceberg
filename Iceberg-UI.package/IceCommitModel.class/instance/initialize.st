initialization
initialize
	model := nil asValueHolder.
	model whenChangedDo: [ :diff | commitButton label: 'Commit onto ' , (self contractedNameFor: diff) ].
	model whenChangedDo: [ :diff | commitPushButton label: 'Commit and Push onto ' , (self contractedNameFor: diff) ].
	super initialize