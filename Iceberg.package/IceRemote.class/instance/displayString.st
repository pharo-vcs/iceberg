displaying
displayString
	^ '{1}: {2}' format: { 
			self remoteName.
			self url }