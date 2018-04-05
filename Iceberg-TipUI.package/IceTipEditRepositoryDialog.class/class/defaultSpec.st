specs
defaultSpec
	<spec: #default>
	
	^ SpecLayout composed 
		newColumn: [ :col |
			col
				newRow: #projectLocation height: self inputTextHeight;
				newRow: [:row | 
					row 
						newColumn: #subdirectoryLabel width: self labelWidth;
						newColumn: #subdirectoryInputText ]
				height: self inputTextHeight ]