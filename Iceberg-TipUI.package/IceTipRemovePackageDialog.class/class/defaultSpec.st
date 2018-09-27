specs
defaultSpec
	<spec: #default>
	
	^ SpecLayout composed 
		newRow: [ :row |
			row 
				newColumn: #iconPanel width: 40 * World displayScaleFactor;
				newColumn: [ :column |
					column 
						newRow: #confirmLabel;
						newRow: #unloadFromImageCheckbox height: self inputTextHeight;
						newRow: #removeFromRepositoryCheckbox height: self inputTextHeight ] ]