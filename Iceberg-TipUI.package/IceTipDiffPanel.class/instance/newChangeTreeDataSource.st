private factory
newChangeTreeDataSource
	^ IceTipTreeDataSource new 
		tool: self;
		rootForItems: self model treeRoots;
		childrenBlock: [ :data | data children ];
		icon: [ :each | each value icon ];
		format: #description;
		yourself