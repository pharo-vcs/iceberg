specs
defaultSpec
	<spec: #default>
	
	^ SpecLayout composed 
		newColumn: [ :column |
			column 
				newRow: #toolbar height: IceTipToolbar defaultHeight;
				newRow: [ :row |
					row 
						newColumn: #sidebarTree;
						addVSplitter;
						newColumn: #historyPanel ] ]