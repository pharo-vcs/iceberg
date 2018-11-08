*Iceberg-TipUI
toggle
	self isExpanded
		ifTrue: [ self collapseAndRefresh ]
		ifFalse: [ self expandAndRefresh ]