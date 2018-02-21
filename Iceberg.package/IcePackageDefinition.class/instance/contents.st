accessing
contents
	
	^ String streamContents: [ :stream |
		stream nextPutAll:	'Package tags: '.
		categories do: [ :elem | 
			stream nextPutAll: String crlf;
				nextPutAll: String tab;
				nextPutAll: elem.
	]]