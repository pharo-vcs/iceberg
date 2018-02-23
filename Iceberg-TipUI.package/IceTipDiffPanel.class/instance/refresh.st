accessing
refresh
	changeList widget 
		in: [ :this |
			this basicSelectRowIndexes: #(). 
			this dataSource 
				rootForItems: self diff elements;
				expandAll ];
		refresh