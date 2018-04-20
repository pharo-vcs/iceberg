specs
defaultSpec 
	<spec>
	^ SpecLayout composed
		newRow: [ :row | 
			row 
				add: #locationLabel width: self labelWidth; 
			 	add: #locationInput; 
				add: #chooseButton width: self iconWidth ]