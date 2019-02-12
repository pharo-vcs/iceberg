initialization
initializeWidgetsContents
	spacePanel := PanelMorph new asSpecAdapter.
	self initializeCurrentBranchLabel.
	branchLabel := self newLabel label: 'Pharo issue Number'.
	issueNumberText := self newTextInput
		ghostText: 'e.g., 12345';
		autoAccept: true.
	issueLabel := self newLabel label: 'Title'.
	issueText := self newTextInput
		ghostText: 'e.g., a-fogbugz-issue';
		autoAccept: true.
		
	issueNumberText whenBuiltDo: [ :w | w widget wrapFlag: false ].
	issueText
		whenBuiltDo: [ :w | 
			w widget wrapFlag: false.
			w widget enabled: false ].
	issueNumberText textHolder whenChangedDo: [ :text | self validateIssue: text ]