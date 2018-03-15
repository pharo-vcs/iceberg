private factory
newBranchListDataSource
	^ IceTipTreeDataSource new
		rootForItems: (self model 
			ifNotNil: #branchModelsByGroup
			ifNil: [ #() ]);
		childrenBlock: [ :each | each children ];
		icon: [ :each | each icon ];
		format: #descriptionWithDecoration;
		yourself