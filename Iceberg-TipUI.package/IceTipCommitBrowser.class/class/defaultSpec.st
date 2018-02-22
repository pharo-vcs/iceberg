specs
defaultSpec
	<spec: #default>
	
	^ SpecLayout composed 
		newColumn: [ :column |
			column 
				newRow: #diffPanel;
				newRow: #commentPanel ]