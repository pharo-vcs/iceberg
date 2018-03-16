initialization
initializeWidgets
	super initializeWidgets.
	
	remoteLabel := self newLabel label: 'Remote:'.
	remoteList := self newDropList.
	remoteList
		items: self model remoteModels;
		displayBlock: [ :each | each descriptionWithDecoration ].
	
	remoteList whenSelectedItemChanged: [ :remoteModel | 
		self moveToRemote: remoteModel  ].
		
	self focusOrder 
		add: self commitsPanel;
		add: self actionPanel;
		add: self remoteList