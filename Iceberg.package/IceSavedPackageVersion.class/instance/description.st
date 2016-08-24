*Iceberg-UI
description
	^ String streamContents: [ :stream | 
		stream 
			nextPutAll: commit shortId; 
			nextPutAll: ' (';
			nextPutAll: (commit datetime asDate = Date today
				ifTrue: [ commit datetime asTime asString ]
				ifFalse: [ commit datetime asDate asString ]);
			nextPut: $) ]
