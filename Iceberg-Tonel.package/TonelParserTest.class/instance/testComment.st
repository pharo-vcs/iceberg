tests
testComment
	self 
		shouldParse: 'this "should" be an error'
		rule: #comment
		raise: TonelParseError.
	
	self  
		assertParse: '"this is a comment"'
		rule: #comment
		equals: 'this is a comment'.
	
	self  
		assertParse: '"""this"" is a comment with ""nested"" colons ""also at the end"""'
		rule: #comment
		equals: '"this" is a comment with "nested" colons "also at the end"'	
		
		
