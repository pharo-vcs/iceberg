specs
defaultSpec 
	<spec>
	
	^ SpecLayout composed
		newRow: [ :row | 
			row 
				add: #remoteLabel width: self iceLabelWidth; 
			 	add: #remoteList; 
				add: #addButton width: self iceIconWidth ]