initialization
initializeWidgets
	commitLabel := self newLabel.
	commits := self newIceTable.
	diff := self instantiate: IceTipCommitInfoPresenter.
	mergeButton := self newButton.
	acceptButton := self newButton.
	rejectButton := self newButton.
	
	commitLabel label: 'Commits'.
	self initializeCommitsTable.
	self initializeDiff.
	mergeButton label: 'Merge into image'.
	acceptButton label: 'Accept pull request'.
	rejectButton label: 'Reject pull request'.
	
	self focusOrder
		add: commits;
		add: diff;
		add: mergeButton;
		add: acceptButton;
		add: rejectButton