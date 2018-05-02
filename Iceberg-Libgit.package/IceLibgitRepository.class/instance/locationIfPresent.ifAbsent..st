API-accessing
locationIfPresent: aBlock ifAbsent: absentBlock

	self location ifNil: [ ^ absentBlock value ].

	^ self location exists
		ifTrue: [ aBlock value: location ]
		ifFalse: [ absentBlock value ]