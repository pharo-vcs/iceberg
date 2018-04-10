private factory
newSidebarTreeDataSource
	^ IceTipTreeOutlineDataSource new 
		tool: self;
		rootForItems: self model branchModelsByGroup;
		childrenBlock: [ :each | each children ];
		icon: [ :each | each icon ];
		format: #descriptionWithDecoration;
		yourself