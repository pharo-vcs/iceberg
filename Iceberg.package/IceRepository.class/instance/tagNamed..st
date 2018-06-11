API-tags
tagNamed: aString 
	
	(self hasTagNamed: aString) ifFalse: [ 
		IceTagNotFound new
			tagName: aString;
			signal ].
		
	^ IceTag named: aString inRepository: self