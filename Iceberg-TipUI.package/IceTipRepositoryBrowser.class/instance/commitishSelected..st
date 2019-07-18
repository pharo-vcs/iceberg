event handling
commitishSelected: ann
	| selection |
	ann newSelectedIndexes
		ifNotEmpty: [ :indexes | 
			selection := sidebarTree widget dataSource elementAt: indexes first.
			(selection depth = 0 or: [ selection hasChildren ])
				ifTrue: [ ^ self	"just refresh on leafs" ].
			historyPanel model: selection data model ]