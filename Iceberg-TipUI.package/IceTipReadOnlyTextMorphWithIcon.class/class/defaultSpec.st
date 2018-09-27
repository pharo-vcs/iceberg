specs
defaultSpec
	<spec: #default>

	^ SpecLayout composed
		newRow: [ :row | 
				row newColumn: #iconWidget width: 40.
				row newColumn: #textWidget].	
