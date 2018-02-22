specs
panelSpec
	<spec: #panel>
	
	^ SpecLayout composed 
		newColumn: [ :column |
			column 
				newRow: #commitList;
				addHSplitter;
				newRow: #commitPanel ]