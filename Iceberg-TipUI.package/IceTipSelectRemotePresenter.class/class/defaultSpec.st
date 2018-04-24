specs
defaultSpec 
	<spec>
	
	^ SpecLayout composed
		newRow: [ :row | 
			row 
				add: #remoteLabel width: self labelWidth; 
			 	add: #remoteList; 
				add: #addButton width: self iconWidth ]