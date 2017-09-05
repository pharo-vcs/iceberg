tests
testTypeDef
	self 
		assertParse: '
"
this is a test
"
Class { 
	#category: ''X'' 
}'
		rule: #typeDef
		equals: { 
			nil.
			'this is a test'. 
			nil.
			'Class'.
			nil.  
			{ #category -> 'X' } asDictionary }