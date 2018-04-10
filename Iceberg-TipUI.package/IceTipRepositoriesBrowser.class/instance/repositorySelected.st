private
repositorySelected
	| selectedIndex |
	self flag: #todo. "This should -maybe- be modeled better on a SpecTablePresenter ;)"
	selectedIndex := repositoryList widget selectedRowIndex.
	selectedIndex = 0 ifTrue: [ ^ nil ].	
	^ repositoryList widget dataSource 
		elementAt: selectedIndex 
		ifAbsent: [ nil ]