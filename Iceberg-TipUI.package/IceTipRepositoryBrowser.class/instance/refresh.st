accessing
refresh
	self rebuildToolbar.
	self sidebarTree widget
		in: [ :this | 
			this deselectAll.
			this dataSource
				rootForItems: self model repositoryModelsByGroup;
				expandRoots ];
		refresh