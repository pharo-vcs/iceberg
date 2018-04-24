specs
defaultSpec
	<spec: #default>
	
	^ SpecLayout composed
		newColumn: [ :column |
			column 
				newRow: #reasonPanel height: 70;
				newRow: #optionsList;
				newRow: #detailPanel ]