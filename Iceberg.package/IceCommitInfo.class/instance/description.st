*Iceberg-UI
description
	^ String streamContents: [ :stream | 
		stream 
			nextPutAll: self shortId; 
			nextPutAll: ' (';
			nextPutAll: (self datetime asDate = Date today
				ifTrue: [ self datetime asTime asString ]
				ifFalse: [ self datetime asDate asString ]);
			nextPut: $) ]
