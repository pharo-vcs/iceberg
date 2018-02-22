specs
defaultSpec
	<spec: #default>
	
	^ SpecLayout composed
		newRow: [ :row |
			row 
				newColumn: #changeList right: 0.7;
				addVSplitter; 
				newColumn: #diffPanel left: 0.3 ]