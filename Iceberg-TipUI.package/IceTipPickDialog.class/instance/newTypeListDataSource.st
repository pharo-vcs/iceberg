private factory
newTypeListDataSource
	^ IceTipTreeOutlineDataSource new 
		rootForItems: self allTypes;
		childrenBlock: [ :each | #() "no children" ];
		format: [ :each | each title ];
		icon: [ :each | each icon ];
		yourself