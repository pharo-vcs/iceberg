accessing
url: aString
	
	url := (aString endsWith: '.git') 
					ifTrue: [ aString ]
					ifFalse: [ aString, '.git' ].
	self parseUrl