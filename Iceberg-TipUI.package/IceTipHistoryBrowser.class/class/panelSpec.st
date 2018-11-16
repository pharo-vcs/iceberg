specs
panelSpec
	<spec>
	
	^ SpecLayout composed 
		newColumn: [ :column |
			column 
				newRow: #commitList;
				addHSplitter;
				newRow: #commitTabPanel ]