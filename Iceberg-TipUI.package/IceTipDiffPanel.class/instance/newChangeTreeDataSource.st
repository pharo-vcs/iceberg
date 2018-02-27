private factory
newChangeTreeDataSource
	^ IceTipTreeDataSource new 
		rootForItems: self model elements;
		childrenBlock: [ :data | data elements ];
		icon: #icon;
		format: #description;
		yourself