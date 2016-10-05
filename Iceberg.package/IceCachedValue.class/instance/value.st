accessing
value
	self isValid ifTrue: [ ^ value ].
	updating ifTrue: [ ^ 'Loading...' asText allItalic ].

	[[ 
		updating := true.
		value := updateAction value.
		^ value
	]
	on: Error do: [ ^ 'Error' asText makeAllColor: Color red ]]
	ensure: [ updating := false ]
