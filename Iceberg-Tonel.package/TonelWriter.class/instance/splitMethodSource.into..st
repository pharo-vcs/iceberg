private
splitMethodSource: aMethodDefinition into: aBlock
	| keywords source declaration |
	
	keywords := aMethodDefinition selector substrings: ':'.
	source := aMethodDefinition source readStream.
	"Skip spaces"
	(source peek isSeparator) ifTrue: [ self skipSeparators: source ].
	"Skip comments"
	(source peek = $") ifTrue: [ self skipComment: source ]. 
	"Parse declaration"
	declaration := String new writeStream.
	[ keywords allSatisfy: [ :each | 
		declaration originalContents 
			includesSubstring: each 
			caseSensitive: true ] ]
	whileFalse: [ 
		"the case of multiple-line selectors"
		((declaration size ~= 0) and: [ source peek isSeparator not])
			ifTrue: [ declaration cr ].
		"get separators"
		[ source peek isSeparator ] whileTrue: [ declaration nextPut: source next ].
		"take next word"
		declaration nextPutAll: (source upToAnyOf: CharacterSet separators) ].
	"verify if parameter is in next line (yes, it can happen)" 
	declaration peekLast = $: ifTrue: [
		declaration space; nextPutAll: (source upToAnyOf: CharacterSet separators) ].
	"restore last separator (it should be enter, but not always)"
	source back.
	aBlock 
		value: (declaration contents trimLeft withLineEndings: self newLine)
		value: (source upToEnd withLineEndings: self newLine)