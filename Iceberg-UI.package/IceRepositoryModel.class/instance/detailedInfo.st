accessing
detailedInfo
	^ 	self repository origin detailedInfo, { 
		'Location' -> self repository location pathString. 
	} 
