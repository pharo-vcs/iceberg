Extension { #name : #Text }

{ #category : #'*Iceberg-TipUI-Spec' }
Text >> threeWayCompareTo: anotherText [
	
	^ self asString threeWayCompareTo: anotherText asString
]
