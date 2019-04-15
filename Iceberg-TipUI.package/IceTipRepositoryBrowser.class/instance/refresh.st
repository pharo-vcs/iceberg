accessing
refresh
	self rebuildToolbar.
	self sidebarTree widget
		in: [ :this | 
			this selectIndexes: #().
			this dataSource
				rootForItems: self model repositoryModelsByGroup;
				expandRoots ];
		refresh