private
packageSelected
	| index |
	self flag: #todo. "This should -maybe- be modeled better on a SpecTablePresenter ;)"
	index := packageList widget selectedRowIndex.
	index = 0 ifTrue: [ ^ self ].
	^ packageList widget dataSource elementAt: index