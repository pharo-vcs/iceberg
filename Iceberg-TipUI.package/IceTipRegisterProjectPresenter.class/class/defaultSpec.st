specs
defaultSpec
	<spec>
	
	^ SpecLayout composed
		newRow: [ :row | 
			row
				newColumn: #typeList width: 160;
				newColumn: #repositoryPanel ]