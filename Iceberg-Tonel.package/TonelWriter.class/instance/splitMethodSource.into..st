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
	[ (keywords allSatisfy: [ :each | 
			declaration originalContents 
			includesSubstring: each 
			caseSensitive: true ]) not
		or: [ declaration contents trimRight last = $: ] ]
	whileTrue: [ 
		"get separators"
		[ source atEnd not and: [ source peek isSeparator ] ]
			whileTrue: [ declaration nextPut: source next ].
		"take next word"
		[ source atEnd not and: [ source peek isSeparator not ] ]
			whileTrue: [ declaration nextPut: source next ] ].
	aBlock 
		value: (declaration contents trimLeft withLineEndings: self newLine)
		value: (source upToEnd withLineEndings: self newLine)