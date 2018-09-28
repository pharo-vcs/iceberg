specs
defaultSpec
	<spec: #default>
	
	^ SpecLayout composed
		newColumn: [ :column |
			column 
				newRow: #reasonPanel height: 70 * World displayScaleFactor;
				newRow: #optionsList;
				newRow: #detailPanel ]