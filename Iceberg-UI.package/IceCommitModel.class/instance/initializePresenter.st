initialization
initializePresenter
	commitButton action: [ self commitPushing: false ].
	commitPushButton action: [ self commitPushing: true ]