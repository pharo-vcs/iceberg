initialization
initialize
	model := nil asValueHolder.
	super initialize.
	model whenChangedDo: [ :changeSet | tree roots: changeSet elements ]
