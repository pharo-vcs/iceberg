writing
writeObject: anObject do: block
	(jsonMode and: [ anObject class ~= STON listClass and: [ anObject class ~= STON mapClass ] ])
		ifTrue: [ self error: 'wrong object class for JSON mode' ].
	self with: anObject do: [
		(self stonNameFor: anObject class) ifNotNil: [ :stonName | 
			writeStream nextPutAll: stonName.
			self prettyPrintSpace ].
		block value ]