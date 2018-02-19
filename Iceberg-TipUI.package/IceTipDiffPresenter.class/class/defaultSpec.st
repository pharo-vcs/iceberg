specs
defaultSpec
	<spec: #default>
	
	^ SpecLayout composed
		newRow: [ :row |
			row 
				newColumn: #changeList width: 400;
				addVSplitter; 
				newColumn: #diffPanel ]