API-tags
createTag: aString 
	
	(self repository hasTagNamed: aString) ifTrue: [ 
		IceTagAlreadyExists new
			tagName: aString;
			signal ].
	self repository tagsAt: aString put: self.
	^ IceTag named: aString inRepository: self repository.