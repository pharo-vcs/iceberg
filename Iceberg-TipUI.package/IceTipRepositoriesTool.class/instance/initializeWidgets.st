initialization
initializeWidgets
	toolbar := self instantiate: IceTipToolbar.
	repositoryList := self newTable asSpecAdapter. 

	self initializeToolbar.
	self initializeRepositoryList.