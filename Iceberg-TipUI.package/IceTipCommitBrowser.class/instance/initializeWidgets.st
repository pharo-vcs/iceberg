accessing
initializeWidgets
	diffPanel := self instantiate: IceTipDiffCommitPanel.
	commentPanel := self instantiate: IceTipCommentPanel on: self model.
	
	self initializeCommentPanel.