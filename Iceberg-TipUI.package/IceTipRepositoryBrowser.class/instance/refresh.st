accessing
refresh
	self rebuildToolbar.
    self sidebarTree widget 
        in: [ :this | 
            this selectRowIndexes: #(). 
            this dataSource 
                rootForItems: self model repositoryModelsByGroup;
                expandRoots ];
        refresh.