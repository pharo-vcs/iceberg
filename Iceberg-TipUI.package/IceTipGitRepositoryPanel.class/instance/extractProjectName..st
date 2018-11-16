utilities
extractProjectName: aString
	| matcher |
	matcher := RxMatcher forString: '.*/(.*)\.git'.
	^ (matcher matches: aString)
		ifTrue: [ matcher subexpression: 2 ]
		ifFalse: [ '' ]