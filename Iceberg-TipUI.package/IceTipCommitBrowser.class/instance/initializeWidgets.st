initialization
initializeWidgets
	super initializeWidgets.
	
	diffPanel := self instantiate: IceTipDiffSelectingPanel on: self model workingCopyDiff.
	diffPanel leftLabel: 'Repository'.
	diffPanel rightLabel: 'Working Copy'.
	
	commentPanel := self instantiate: IceTipCommentPanel on: self model.
	commentPanel onCommit: [ self doCommit ].
	"a hack because text comment cannot react to cmd+s 'as usual'."
	commentPanel commentText whenBuiltDo: [ :ann |  
		self addShortcutsTo: ann widget textArea ].
			
	self whenBuiltDo: [ :ann |  self addShortcutsTo: ann widget ].

	self focusOrder 
		add: commentPanel;
		add: diffPanel