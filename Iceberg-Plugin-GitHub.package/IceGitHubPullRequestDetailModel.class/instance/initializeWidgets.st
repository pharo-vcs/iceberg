initialization
initializeWidgets
	urlLabel := self newLabel label: 'Url'.
	authorLabel := self newLabel label: 'Author'.
	mergeableLabel := self newLabel label: 'Mergeable'.
	statusLabel := self newLabel label: 'Status'.
	checksLabel := self newLabel label: 'Validations'.
	bodyLabel := self newLabel label: 'Comment'.

	urlText := self newTextInput 
		enabled: false;
		text: self pullRequest url.
	authorText  := self newTextInput 
		enabled: false;
		text: self pullRequest author.
	mergeableText := self newTextInput
		enabled: false.
	statusPanel := self newStatusPanel.
	checksTable := self newChecksTable.
	bodyText := self newText 
		enabled: false;
		text: self pullRequest body.