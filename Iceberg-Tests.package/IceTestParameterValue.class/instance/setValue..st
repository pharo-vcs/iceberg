activating
setValue: newValue
	^ self target perform: self selector asMutator with: newValue