testing
isAvailableFor: aRepository

	^ aRepository remotes anySatisfy: [ :each | each projectName = 'pharo' ]