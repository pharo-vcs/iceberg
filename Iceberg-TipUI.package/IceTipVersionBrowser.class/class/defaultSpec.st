specs
defaultSpec
	<spec: #default>
	
	^ SpecLayout composed 
		newColumn: [ :column |
			column 
				newRow: #commitList;
				addHSplitter;
				newRow: #commitTabPanel ]