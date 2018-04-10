accessing
selectedPackage
	| index |
	self flag: #todo. "This should -maybe- be modeled better on a SpecTablePresenter ;)"
	index := packagesList widget selectedRowIndex.
	index = 0 ifTrue: [ ^ nil ].
	^ packagesList widget dataSource elementAt: index