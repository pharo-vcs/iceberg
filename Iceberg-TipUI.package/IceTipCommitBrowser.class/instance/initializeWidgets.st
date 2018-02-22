initialization
initializeWidgets
	diffPanel := self instantiate: IceTipDiffSelectingPanel on: self model workingCopyDiff.
	commentPanel := self instantiate: IceTipCommentPanel on: self model.
	
	diffPanel selectedItems: self model workingCopyDiff allElements