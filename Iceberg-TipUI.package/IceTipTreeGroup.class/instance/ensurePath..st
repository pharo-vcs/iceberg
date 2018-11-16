accessing
ensurePath: aPath
	| first next |
	
	first := aPath first.
	next := self children 
		detect: [ :each | each isSameAs: first ]
		ifNone: [ self addChild: (first copy children: OrderedCollection new) ].
	^ aPath allButFirst 
		ifNotEmpty: [ :remainingPath | next ensurePath: remainingPath ]
		ifEmpty: [ next ]