accessing
refresh
	changeList widget 
		in: [ :this | 
			this dataSource 
				rootForItems: self diff elements;
				expandAll ];
		refresh