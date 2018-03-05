specs
defaultSpec
	<spec: #default>
	
	^ SpecLayout composed 
		newColumn: [ :column |
			column 
				newRow: #toolbar height: IceTipToolbar defaultHeight;
				newRow: [ :row |
					row 
						add: #sidebarTree right: 0.7;
						addVSplitter;
						add: #historyPanel withSpec: #panelSpec left: 0.3 ] ]