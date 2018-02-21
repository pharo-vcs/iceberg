private factory
newSidebarTreeDataSource
	^ IceTipTreeDataSource new 
		rootForItems: self model branchesByGroup;
		childrenBlock: [ :data | 
			self flag: #todo. "Maybe do something better than this?"
			(data respondsTo: #elements)
				ifTrue: [ data elements ]
				ifFalse: [ #() ] ];
		format: #name;
		yourself