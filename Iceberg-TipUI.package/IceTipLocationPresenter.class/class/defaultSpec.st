specs
defaultSpec 
	<spec>
	^ SpecLayout composed
		newRow: [ :row | 
			row 
				add: #locationLabel width: self iceLabelWidth; 
			 	add: #locationInput; 
				add: #chooseButton width: self iceIconWidth ]