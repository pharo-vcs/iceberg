initialization
initializeWidgets

	titleLabel := self newLabel.
	titlePanel := self newTextInput autoAccept: true.
	headLabel := self newLabel.
	headForkList := self newDropList.
	headBranchList := self newDropList.
	baseLabel := self newLabel.
	baseForkList := self newDropList.
	baseBranchList := self newDropList.
	bodyLabel := self newLabel.
	bodyPanel := self newText autoAccept: true.
		
	titleLabel label: 'Title'.
	headLabel label: 'From (Head)'.
	baseLabel label: 'To (Base)'.
	bodyLabel label: 'Comment'.
	
	self focusOrder 
		add: titlePanel;
		add: headForkList;
		add: headBranchList;
		add: baseForkList;
		add: baseBranchList;
		add: bodyPanel