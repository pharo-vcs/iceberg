Extension { #name : #TAssertable }

{ #category : #'*Iceberg-Pharo6' }
TAssertable >> deny: actual equals: expected [
	^ self
		assert: expected ~= actual
		description: [self comparingStringBetween: actual and: expected]
]
