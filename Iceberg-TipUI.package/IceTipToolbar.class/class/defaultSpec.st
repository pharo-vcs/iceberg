specs
defaultSpec
	<spec: #default>

	^ SpecLayout composed
		newRow: [ :row |
			row 
				newColumn: #leftPanel;
				newColumn: #rightPanel ]