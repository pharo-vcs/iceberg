private factory
newRequestTo: aString
	^ ZnClient new 
		in: [ :this | 
			isAnonymous ifFalse: [ 
				this
					username: self credentials username 
					password: self credentials password ] ]; 
		headerAt: 'Accept' put: 'application/vnd.github.v3+json';
		url: 'https://api.github.com/', (aString first = $/
			ifTrue: [ aString allButFirst ]
			ifFalse: [ aString ]);
		yourself