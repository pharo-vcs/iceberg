initialization
initializePresenter
	message acceptBlock: [ :text | 
		text ifNotEmpty: [ self repository commitWithMessage: text asString. ] ].
	commitButton action: [ message accept ].
	refreshButton action: [ self model refresh ]