initialization
initializeWidgets
	message := self newText.
	commitButton := self newButton 
		label: 'Commit';
		yourself.
		
	pushCheckbox := self newCheckBox
		label: 'Upload changes on commit?';
		state: self class uploadChangesOnCommit;
		yourself.
	
	self focusOrder 
		add: message.