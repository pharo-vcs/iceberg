initialization
initializePresenter
	message acceptBlock: [ :text | self commitPackagesWithMessage: text].
	commitButton action: [ message accept ].
