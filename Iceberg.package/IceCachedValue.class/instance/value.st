accessing
value
	self isValid ifTrue: [ ^ value ].
	updating ifTrue: [ ^ 'Loading...' asText allItalic ].

	[ 
		updating := true.
		value := updateAction value.
		^ value
	]
	ensure: [ updating := false ]
