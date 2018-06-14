specs
defaultSpec
	<spec: #default>
	^ SpecLayout composed
		newColumn: [ :col | 
			col
				newRow: [ :row | 
					row
						add: #nameLabel width: 100;
						add: #nameInput ]
					height: self inputTextHeight;
				newRow: [ :row | 
					row
						add: #sourceDirectoryLabel width: 100;
						add: #sourceDirectoryTree ]
					height: 300;
				newRow: [ :row | 
					row
						newColumn: [ :column | "empty" ] width: 100;
						add: #sourceDirectorySelectionLabel ]
					height: self inputTextHeight;
				newRow: [ :row | 
					row
						add: #formatLabel width: 100;
						add: #formatList ]
					height: self inputTextHeight ]