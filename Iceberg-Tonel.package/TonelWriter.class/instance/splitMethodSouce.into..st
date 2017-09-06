private
splitMethodSouce: aMethodDefinition into: aBlock
	| keywords sourceStream declaration |
	
	keywords := aMethodDefinition selector substrings: ':'.
	sourceStream := aMethodDefinition source readStream.
	declaration := ''.
	[ keywords allSatisfy: [ :each | declaration includesSubstring: each caseSensitive: true ] ]
	whileFalse: [ 
		declaration ifNotEmpty: [ declaration := declaration, self newLine ].
		declaration := declaration, (sourceStream upToAnyOf: CharacterSet crlf) ].
	declaration := declaration trimBoth.
	"verify if parameter is in next line (yes, it can happen)" 
	declaration last = $: ifTrue: [ 
		declaration := declaration, ' ', (sourceStream upToAnyOf: CharacterSet separators) ].
	aBlock 
		value: declaration 
		value: (sourceStream upToEnd withLineEndings: self newLine)