tests
testTypeDef
	self 
		assertParse: '
"
this is a test
"
Class { 
	#name: ''X'',
	#superclass: ''Y'',
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