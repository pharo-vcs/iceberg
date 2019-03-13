private
obtainCommonCategory: aString from: aCollection

	^ (aCollection allSatisfy: [ :each | each beginsWith: aString ])
		ifTrue: [ aString ]
		ifFalse: [ 
			(aString includes: $-) 
				ifTrue: [ self obtainCommonCategory: (aString copyUpToLast: $-) from: aCollection ]
				ifFalse: [ '' ] ]