private
findOrCreatePath: parents on: root
	| path next  |
	
	path := parents first.
	next := root children
		detect: [ :each | each data = path data ]
		ifNone: [ root addChild: path toStaticItem ].
	^ parents allButFirst 
		ifNotEmpty: [ :remaining | self findOrCreatePath: remaining on: next ]		
		ifEmpty: [ next ]
	