initialization
initializeWidgets
	super initializeWidgets.
	
	remotePanel := self instantiate: IceTipSelectRemotePresenter on: self model. 
	remotePanel remoteList whenSelectedItemChanged: [ :remoteModel | 
		self moveToRemote: remoteModel  ].
		
	self focusOrder 
		add: self commitsPanel;
		add: self actionPanel;
		add: self remotePanel