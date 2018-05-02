testing
isAvailableFor: aRepository

	^ (self hasPharoInOrigin: aRepository) or: [ self hasPharoInRemotes: aRepository ]