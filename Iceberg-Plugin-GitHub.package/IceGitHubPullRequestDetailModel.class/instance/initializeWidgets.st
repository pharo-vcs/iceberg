initialization
initializeWidgets
	urlLabel := self newLabel label: 'Url'.
	authorLabel := self newLabel label: 'Author'.
	fromLabel := self newLabel label: 'From'.
	toLabel := self newLabel label: 'Into'.
	mergeableLabel := self newLabel label: 'Mergeable'.
	statusLabel := self newLabel label: 'Status'.

	urlText := self newTextInput 
		enabled: false;
		text: self pullRequest url.
	authorText  := self newTextInput 
		enabled: false;
		text: self pullRequest author.
	fromText  := self newTextInput 
		enabled: false;
		text: self pullRequest headLabel.
	toText  := self newTextInput 
		enabled: false;
		text: self pullRequest baseLabel.
	mergeablePanel := self newMergeablePanel.
	statusPanel := self newStatusPanel.
	checksTable := self newChecksTable.
	bodyText := self newText 
		enabled: false;
		text: self pullRequest body.