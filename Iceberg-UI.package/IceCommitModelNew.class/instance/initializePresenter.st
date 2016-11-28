initialization
initializePresenter
	message acceptBlock: [ :text | self commitWithMessage: text].
	commitButton action: [ message accept ].
