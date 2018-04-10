private
projectAsPathToAppend
	(self userName isEmpty and: [ self projectName isEmpty ])
		ifTrue: [ ^ '' ]. 
	^ (self userName ifEmpty: [ '?' ]), '/', self projectName