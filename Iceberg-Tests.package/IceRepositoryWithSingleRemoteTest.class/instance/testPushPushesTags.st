tests-push
testPushPushesTags

	(self repository isKindOf: IceMemoryRepository)
		ifTrue: [ 
			self flag: #toFix.
			^ self skip ].

	self repository pull.
	self repository createTag: 'exampleTag'.
	self repository pushTo: self remote.	
	
	self assert: (self remoteRepository tagNames includes: 'exampleTag')