specs
defaultSpec 
	<spec>

	^ SpecLayout composed
		newColumn: [ :column |
			column
				newRow: [ :row | 
					row 
						newColumn: #nameLabel width: self labelWidth; 
						newColumn: #nameText ] 
					height: self inputTextHeight;
				newRow: [ :row | 
					row 
						newColumn: #urlLabel width: self labelWidth; 
						newColumn: #urlText ] 
					height: self inputTextHeight ];
		yourself