initialization
initializePresenter
	message acceptBlock: [ :text | 
		text ifNotEmpty: [ self halt. self model commitWithMessage: text asString ] ].
	commitButton action: [ message accept ]