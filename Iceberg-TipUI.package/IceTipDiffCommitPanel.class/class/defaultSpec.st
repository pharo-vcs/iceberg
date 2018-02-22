specs
defaultSpec
	<spec: #default>
	
	^ SpecLayout composed
		newRow: [ :row |
			row 
				newColumn: #changeList width: 350;
				addVSplitter; 
				newColumn: #diffPanel ]