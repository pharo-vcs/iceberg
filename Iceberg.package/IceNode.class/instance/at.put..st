accessing
at: aString put: aNode 
	
	aNode parent: self.
	childrenDictionary at: aString put: aNode