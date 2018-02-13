initialization
initializeWidgets
	toolbar := self instantiate: IceTipToolbar.
	repositoryList := self instantiate: FastTablePresenter. 
	
	self buildToolbarItems