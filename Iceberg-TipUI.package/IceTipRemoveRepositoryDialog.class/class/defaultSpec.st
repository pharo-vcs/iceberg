specs
defaultSpec
	<spec: #default>
	
	^ SpecLayout composed 
		newRow: [ :row |
			row 
				newColumn: #iconPanel width: World displayScaleFactor;
				newColumn: [ :column |
					column 
						newRow: #confirmLabel;
						newRow: #removeFileSystemCheckbox height: self inputTextHeight ] ]
