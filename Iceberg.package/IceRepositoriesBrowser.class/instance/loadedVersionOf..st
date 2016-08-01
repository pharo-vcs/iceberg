utilities
loadedVersionOf: package
	^ package isLoaded 
		ifTrue: [ 
			String streamContents: [ :stream | 
				| commit |
				commit := package loadedVersion commit.
				stream 
					nextPutAll: (commit id first: 7); 
					nextPutAll: ' (';
					nextPutAll: (commit datetime asDate = Date today
						ifTrue: [ commit datetime asTime asString ]
						ifFalse: [ commit datetime asDate asString ]);
					nextPut: $) ]]
		ifFalse: [ '' ].

