displaying
displayString
	^ '{1}: {2}' format: { 
			self name.
			self url }