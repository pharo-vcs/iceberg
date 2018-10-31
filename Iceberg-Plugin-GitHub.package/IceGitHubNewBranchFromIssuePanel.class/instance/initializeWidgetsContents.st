initialization
initializeWidgetsContents
	spacePanel := PanelMorph new asSpecAdapter.
	
	self initializeCurrentBranchLabel.
	
	remotePanel := self instantiate: IceTipSelectRemotePresenter on: self selectRemoteModel.
	remotePanel remoteList whenSelectedItemChanged: [ :remoteModel | 
		self useRemote: remoteModel  ].

	branchLabel := self newLabel label: 'Issue number:'.
	issueNumberText := self newTextInput
		ghostText: 'e.g., 123';
		autoAccept: true.
	issueLabel := self newLabel label: 'Title:'.
	issueText := self newTextInput
		ghostText: 'e.g., 123-github-issue';
		autoAccept: true.
		
	issueNumberText whenBuiltDo: [ :w | w widget wrapFlag: false ].
	issueText
		whenBuiltDo: [ :w | 
			w widget wrapFlag: false.
			w widget enabled: false ].
	issueNumberText textHolder whenChangedDo: [ :text | self validateIssue: text ]