tests-tags
testTagAlreadyExistsErrorInformsExistingTagName
	
	| tagName |
	self repository head isUnbornBranch ifTrue: [ ^ self skip ].
	
	tagName := 'someTag'.
	self repository createTag: tagName.
	[ self repository createTag: tagName.
	  self fail ]
		on: IceTagAlreadyExists
	 	do: [ :error | self assert: error tagName equals: tagName ]