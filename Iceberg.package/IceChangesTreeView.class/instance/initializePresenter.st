initialization
initializePresenter
	changeSetHolder whenChangedDo: [ :changeSet | 
		self initializeRoots.
		changeSet whenChangedDo: [ self initializeRoots ]
 	]
