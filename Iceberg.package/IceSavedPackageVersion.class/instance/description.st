*Iceberg-UI
description
	[ self commit ] on: Error do: [ ^ self internalCommitId ].

	^ String streamContents: [ :stream | 
		stream 
			nextPutAll: commit shortId; 
			nextPutAll: ' (';
			nextPutAll: (commit datetime asDate = Date today
				ifTrue: [ commit datetime asTime asString ]
				ifFalse: [ commit datetime asDate asString ]);
			nextPut: $) ]
