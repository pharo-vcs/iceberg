private factory
newPackagesListDataSource
	| dataSource |
	^ (dataSource := IceTipSelectingDataSource new)
		tool: self;
		elements: self allPackagesNotRegistered;
		onSelectionChangedBlock: [ :item :wasSelected | wasSelected ifTrue: [ acceptButton enable ] ifFalse: [ dataSource selectedItems ifEmpty: [ acceptButton disable ] ] ];
		yourself