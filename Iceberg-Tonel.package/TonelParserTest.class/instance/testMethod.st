tests
testMethod
	self 
		assertParse: 'Object>>name' 
		rule: #method
		equals: { 'Object'. 'name' }.
		
	self 
		assertParse: 'Object >> name: aString' 
		rule: #method
		equals: { 'Object'. 'name: aString' }.
		
	self 
		assertParse: 'Object >> name: aString [ I do not care ]' 
		rule: #method
		equals: { 'Object'. 'name: aString' }.
		
	self 
		assertParse: 'Object class >> name: aString' 
		rule: #method
		equals: { 'Object class'. 'name: aString' }.
	