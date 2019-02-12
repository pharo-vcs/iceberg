accessing
basicRefresh
	self resetDiffContents.
	changeList widget 
		in: [ :this |
			this deselectAll. 
			self resetDataSource: this dataSource ];
		refresh.
