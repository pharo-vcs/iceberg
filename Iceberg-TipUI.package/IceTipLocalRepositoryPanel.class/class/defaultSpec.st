specs
defaultSpec
	<spec: #default>

	^ SpecLayout composed 
		newColumn: [ :col | 
			col
				newRow: #projectLocation
					height: self inputTextHeight;
				newRow: #spacePanel ]