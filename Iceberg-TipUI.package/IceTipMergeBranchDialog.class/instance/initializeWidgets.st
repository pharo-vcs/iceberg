initialization
initializeWidgets
	branchPanel := self instantiate: IceTipSelectBranchPanel on: self model.
	branchPanel onAccept: [ self acceptAndClose ].
	
	self focusOrder 
		add: self branchPanel