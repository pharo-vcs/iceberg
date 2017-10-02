private
toSTON: anObject
	^ (String streamContents: [ :stream | 
		(ShoalSTONWriter on: stream) nextPut: anObject ])
		withLineEndings: self newLine