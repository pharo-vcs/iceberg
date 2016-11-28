actions
changeLocation
	(UIManager default chooseDirectory: self location) 
		ifNotNil: [ :fileReference | 
			self location: fileReference.
			self localDirectory label: fileReference pathString ]