private factory
newChangeTreeDataSource
	^ IceTipTreeSelectingDataSource new
		tool: self;
		rootForItems: self model treeRoots;
		childrenBlock: [ :data | data children ];
		icon: [ :each | each value icon ];
		format: #description;
		selectAll;
		yourself