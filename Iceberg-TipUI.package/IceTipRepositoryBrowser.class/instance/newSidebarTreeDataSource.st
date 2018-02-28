private factory
newSidebarTreeDataSource
	^ IceTipTreeOutlineDataSource new 
		rootForItems: self model branchesByGroup;
		childrenBlock: [ :data | 
			self flag: #todo. "Maybe do something better than this?"
			(data respondsTo: #elements)
				ifTrue: [ data elements ]
				ifFalse: [ #() ] ];
		icon: [ :each | 
			(each respondsTo: #icon)
				ifTrue: [ each icon ]
				ifFalse: [ nil ] ];
		format: #name;
		yourself