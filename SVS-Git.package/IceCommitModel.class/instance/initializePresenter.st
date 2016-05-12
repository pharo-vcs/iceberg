initialization
initializePresenter
	message acceptBlock: [ :text | self model commitWithMessage: message text ].
	commitButton action: [ message accept ]