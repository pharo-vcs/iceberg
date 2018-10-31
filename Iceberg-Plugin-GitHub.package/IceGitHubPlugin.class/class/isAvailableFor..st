testing
isAvailableFor: aRepository

	^ aRepository remotes anySatisfy: [ :each | each host = 'github.com' ]