initialization
initializeWidgets
	super initializeWidgets.
	
	diffPanel := self instantiate: IceTipDiffSelectingPanel on: self model workingCopyDiff.
	commentPanel := self instantiate: IceTipCommentPanel on: self model.
	commentPanel onCommit: [ self doCommit ].
		
	self whenBuiltDo: [ :ann | self addShortcutsTo: ann widget ].
	
	self focusOrder 
		add: diffPanel;
		add: commentPanel