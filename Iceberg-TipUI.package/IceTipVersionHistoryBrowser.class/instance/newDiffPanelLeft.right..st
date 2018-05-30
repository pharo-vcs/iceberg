private factory
newDiffPanelLeft: leftString right: rightString
	^ (self instantiate: DiffPresenter) 
		leftText: leftString;
		rightText: rightString;
		showOptions: false;
		buildWithSpec