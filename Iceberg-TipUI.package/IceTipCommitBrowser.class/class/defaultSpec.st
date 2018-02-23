specs
defaultSpec
	<spec: #default>
	
	^ SpecLayout composed 
		newColumn: [ :column |
			column 
				newRow: #diffPanel top: 0.35;
				addHSplitter;
				newRow: #commentPanel bottom: 0.65 ]