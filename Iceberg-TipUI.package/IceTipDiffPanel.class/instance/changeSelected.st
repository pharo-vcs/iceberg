private
changeSelected
	| index |
	self flag: #todo. "This should -maybe- be modeled better on a SpecTablePresenter ;)"
	index := changeList widget selectedRowIndex.
	index = 0 ifTrue: [ ^ nil ].
	^ changeList widget dataSource realElementAt: index