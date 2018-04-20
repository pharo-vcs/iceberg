initialization
initializeWidgets
	remoteLabel := self newLabel label: 'Remote:'.
	remoteList := self newDropList.
	remoteList
		items: self model remoteModels;
		displayBlock: [ :each | each descriptionWithDecoration ].
		
	addButton := self newButton icon: self icon.
	addButton action: [ self addRemote ].
	
	remoteList setSelectedItem: self model remoteModel.
	
	self focusOrder 
		add: remoteList