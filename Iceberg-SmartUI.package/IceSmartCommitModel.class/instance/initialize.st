initialization
initialize
	model := nil asValueHolder.
	model whenChangedDo: [ :diff | commitButton label: 'Commit onto ' , (self contractedNameFor: diff) ].
	super initialize