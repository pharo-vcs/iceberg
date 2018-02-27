specs
defaultSpec
	<spec: #default>
	
	^ SpecLayout composed 
		newColumn: [ :column |
			column 
				newRow: #toolbar height: IceTipToolbar defaultHeight;
				newRow: [ :row |
					row 
						newColumn: #sidebarTree right: 0.7;
						addVSplitter;
						newColumn: #historyPanel left: 0.3 ] ]