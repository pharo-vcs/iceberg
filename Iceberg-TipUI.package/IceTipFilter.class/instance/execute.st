execution
execute
	| newElements |
	
	newElements := self dataSource elements species new.
	self dataSource elements do: [ :each |
		(self matches: each) 
			ifTrue: [ newElements add: each ] ].

	^ self dataSource copy
		elements: newElements;
		yourself