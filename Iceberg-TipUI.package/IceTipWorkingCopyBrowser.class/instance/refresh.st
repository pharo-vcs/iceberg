accessing
refresh
	self rebuildToolbar. 
	packageList widget 
		in: [ :this | this dataSource elements: self model packageModels ];
		refresh.
	statusBar refresh