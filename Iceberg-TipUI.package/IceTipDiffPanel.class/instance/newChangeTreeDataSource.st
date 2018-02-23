private factory
newChangeTreeDataSource
	^ IceTipTreeDataSource new 
		rootForItems: #(); "They will be updated on refresh"
		childrenBlock: [ :data | data elements ];
		icon: #icon;
		format: #description;
		yourself