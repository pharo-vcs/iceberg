specs
defaultSpec
	<spec: #default>
	
	^ SpecLayout composed 
		newRow: [ :row |
			row 
				newColumn: #iconPanel width: 40;
				newColumn: #errorLabel ]