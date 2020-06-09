accessing
basicRefresh
	self resetDiffContents.
	changeList widget
		in: [ :this | 
			this selectIndexes: #().
			self resetDataSource: this dataSource ];
		refresh