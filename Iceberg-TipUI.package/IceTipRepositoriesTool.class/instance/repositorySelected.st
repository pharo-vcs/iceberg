private
repositorySelected
	self flag: #todo. "This should -maybe- be modeled better on a SpecTablePresenter ;)"
	^ repositoryList widget dataSource elementAt: repositoryList widget selectedRowIndex 