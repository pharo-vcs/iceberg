private factory
newChangeTreeDataSource
	^ IceTipTreeSelectingDataSource new
		rootForItems: self model elements;
		childrenBlock: [ :data | data elements ];
		icon: #icon;
		format: #description;
		selectAll;
		yourself