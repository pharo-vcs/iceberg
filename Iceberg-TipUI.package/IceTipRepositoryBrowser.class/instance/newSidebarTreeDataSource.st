private factory
newSidebarTreeDataSource
	^ IceTipTreeDataSource new 
		tool: self;
		rootForItems: self model repositoryModelsByGroup;
		childrenBlock: [ :each | each children ];
		icon: [ :each | each icon ];
		format: #descriptionWithDecoration;
		yourself