accessing
branchSelected
	| index |
	self flag: #todo. "This should -maybe- be modeled better on a SpecTablePresenter ;)"
	index := branchesList widget selectedRowIndex.
	index = 0 ifTrue: [ ^ nil ].
	^ (branchesList widget dataSource realElementAt: index) model