accessing
refresh
	self model reset.
	changeList widget 
		in: [ :this |
			this basicSelectRowIndexes: #(). 
			this dataSource 
				rootForItems: self model elements;
				selectAll;
				expandAll ];
		refresh