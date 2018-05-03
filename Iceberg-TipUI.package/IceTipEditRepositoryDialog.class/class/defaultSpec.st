specs
defaultSpec
	<spec: #default>
	
	^ SpecLayout composed 
		newColumn: [ :col |
			col
				newRow: #projectLocation height: self inputTextHeight;
				newRow: [:row | 
					row 
						newColumn: #subdirectoryLabel width: self iceLabelWidth;
						newColumn: #subdirectoryInputText ]
				height: self inputTextHeight ]