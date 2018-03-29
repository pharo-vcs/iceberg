accessing
basicRefresh
	self resetDiffContents.
	changeList widget 
		in: [ :this |
			this selectRowIndexes: #(). 
			self resetDataSource: this dataSource ];
		refresh.
