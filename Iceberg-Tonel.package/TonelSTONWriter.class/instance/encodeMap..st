writing
encodeMap: pairs
	| first |
	first := true.
	writeStream nextPut: ${.
	pairs isEmpty
		ifTrue: [
			self prettyPrintSpace ]
		ifFalse: [
			self indentedDo: [
				pairs size = 1 
					ifTrue: [ self prettyPrintSpace ]
					ifFalse: [ self newlineIndent ].
				pairs keysAndValuesDo: [ :key :value |
					first 
						ifTrue: [ first := false ] 
						ifFalse: [ self mapElementSeparator ].
					self encodeKey: key value: value ] ].
				pairs size = 1 
					ifTrue: [ self prettyPrintSpace ]
					ifFalse: [ self newlineIndent ] ].
	writeStream nextPut: $}