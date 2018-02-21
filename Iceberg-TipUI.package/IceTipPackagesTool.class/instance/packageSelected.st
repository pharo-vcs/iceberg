private
packageSelected
	self flag: #todo. "This should -maybe- be modeled better on a SpecTablePresenter ;)"
	^ packageList widget dataSource elementAt: packageList widget selectedRowIndex