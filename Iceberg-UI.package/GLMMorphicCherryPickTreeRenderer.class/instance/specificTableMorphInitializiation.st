initialization
specificTableMorphInitializiation
	super specificTableMorphInitializiation.
	tableModel glamourPresentation isAllSelected
		ifTrue: [ tableModel selectAllWithChildren: tableModel glamourPresentation transformation value ]