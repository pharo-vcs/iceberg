initialization
initializeWidgets

	super initializeWidgets.
	issueNumberText := self newTextInput autoAccept: true.
	issueText := self newTextInput autoAccept: true.
	
	issueNumberText whenBuiltDo: [ :w | w widget wrapFlag: false ]. 
	issueText whenBuiltDo: [ :w | 
		w widget wrapFlag: false.
		w widget enabled: false ]. 
	issueNumberText textHolder 
		whenChangedDo: [ :text | self validateIssue: text ].
		
	self focusOrder
		add: issueNumberText;
		add: issueText