initialization
initializeWidgets
	iconPanel := self newIcePanel.
	iconPanel widget addMorph: #question asIcon asMorph.
	
	confirmLabel := self newIceReadOnlyText. 
	confirmLabel widget contentsWrapped: (self class confirmMessage 
		format: { 
			self repository name. 
			self branchName }).
	mergeWithMasterCheckbox := self newCheckBox
		label: ('Merge with branch {1}' format: { self repository branchName });
		state: true.

	self focusOrder 
		add: mergeWithMasterCheckbox