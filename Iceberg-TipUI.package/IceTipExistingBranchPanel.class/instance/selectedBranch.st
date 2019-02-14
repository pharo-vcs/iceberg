accessing
selectedBranch
	| index |

	index := self branchesList widget selectedIndex.
	^ index ~= 0
		ifTrue: [ self branchesList widget dataSource elementAt: index ]
		ifFalse: [ nil ]