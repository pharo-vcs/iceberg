private
changeSelected
	self flag: #todo. "This should -maybe- be modeled better on a SpecTablePresenter ;)"
	^ changeList widget dataSource realElementAt: changeList widget selectedRowIndex