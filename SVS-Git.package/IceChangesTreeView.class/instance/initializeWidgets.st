initialization
initializeWidgets
	tree := self newTree 
		beCheckList; 
		autoMultiSelection: true;
		childrenBlock: [ :changeSet | changeSet elements ];
		"columns: { TreeColumnModel new displayBlock: [:node | node name ] }"
		yourself.
		
	self focusOrder add: tree.