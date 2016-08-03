initialization
initializeWidgets
	remoteUrlLabel := self newLabel label: 'Remote URL'.
	remoteUrl := self newTextInput text: 'git@github.com:'; autoAccept: true.
	self focusOrder add: remoteUrl.

	super initializeWidgets.
	

