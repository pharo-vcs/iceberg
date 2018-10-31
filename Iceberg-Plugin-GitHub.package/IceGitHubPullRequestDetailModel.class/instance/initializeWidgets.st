initialization
initializeWidgets
	urlLabel := self newLabel label: 'Url'.
	authorLabel := self newLabel label: 'Author'.
	fromLabel := self newLabel label: 'From'.
	toLabel := self newLabel label: 'Into'.
	mergeableLabel := self newLabel label: 'Mergeable'.
	statusLabel := self newLabel label: 'Status'.

	urlText := self newTextInput enabled: false.
	authorText  := self newTextInput enabled: false.
	fromText  := self newTextInput enabled: false.
	toText  := self newTextInput enabled: false.
	mergeablePanel := self newMergeablePanel.
	statusPanel := self newStatusPanel.
	checksTable := self newChecksTable.
	bodyText := self newText enabled: false.