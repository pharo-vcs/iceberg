private
packageSelected
	| index dataSource |
	self flag: #todo. "This should -maybe- be modeled better on a SpecTablePresenter ;)"
	index := packageList widget selectedRowIndex.
	index = 0 ifTrue: [ ^ nil ].
	dataSource := packageList widget dataSource.
	dataSource hasElements ifFalse: [ ^ nil ].
	^ dataSource elementAt: index