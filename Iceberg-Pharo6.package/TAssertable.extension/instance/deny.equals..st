*Iceberg-Pharo6
deny: actual equals: expected
	^ self
		assert: expected ~= actual
		description: [self comparingStringBetween: actual and: expected]