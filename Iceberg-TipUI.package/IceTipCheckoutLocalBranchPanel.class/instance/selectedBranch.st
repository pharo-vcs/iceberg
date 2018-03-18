accessing
selectedBranch
	| index |
	
	index := self branchesList widget selectedRowIndex.
	index ~= 0 
		ifTrue: [ self branchesList dataSource elementAt: index ]
		ifFalse: [ nil ]