initialization
initializePresenter
	message acceptBlock: [ :text | 
		text ifNotEmpty: [ self model commitWithMessage: message text ] ].
	commitButton action: [ message accept ]