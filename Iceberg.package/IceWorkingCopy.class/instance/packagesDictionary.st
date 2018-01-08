packages
packagesDictionary
	
	packages ifNil: [ 
		packages := Dictionary new.
		repository head packages do: [ :each |
			packages at: each name put: each ] ].
	
	^ packages