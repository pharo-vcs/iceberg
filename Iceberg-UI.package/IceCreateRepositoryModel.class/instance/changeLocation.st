actions
changeLocation
	(UIManager default chooseDirectory: 'Choose local repository' path: self location) 
		ifNotNil: [ :fileReference | 
			self location: fileReference.
			self localDirectory label: fileReference pathString ]