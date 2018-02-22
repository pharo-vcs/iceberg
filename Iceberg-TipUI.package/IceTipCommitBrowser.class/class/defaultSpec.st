specs
defaultSpec
	<spec: #default>
	
	^ SpecLayout composed 
		newColumn: [ :column |
			column 
				newRow: #diffPanel bottom: 0.35;
				addHSplitter;
				newRow: #commentPanel ]