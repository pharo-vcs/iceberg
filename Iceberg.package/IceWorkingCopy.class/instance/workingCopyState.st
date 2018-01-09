accessing
workingCopyState
	
	| commits intersection |
	
	self packages ifEmpty: [ 
		^ repository head commit asWorkingCopyState ].
	
	intersection := (self packages select: #isLoaded thenCollect: #currentCommit)
		inject: (IceNoCommit repository: repository)
		into: [ :a :b | a intersectionCommitWith: b ].

	^ intersection asWorkingCopyState
	
"	commits size = 1
		ifTrue: [ ^ commits anyOne asWorkingCopyState ].
		
	^ IceUnknownCommitWorkingCopyState on: commits repository: repository."