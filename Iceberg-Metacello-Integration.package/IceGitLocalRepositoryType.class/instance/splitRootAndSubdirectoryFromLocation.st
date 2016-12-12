as yet unclassified
splitRootAndSubdirectoryFromLocation
	| root subDir |
	
	subDir := #().
	root := (self location copyAfter: $:) asFileReference.
	[ root isNil or: [ self isGitRoot: root ] ] 
		whileFalse: [ 
			subDir := subDir copyWithFirst: root basename.
			root := root parent ].
	root ifNil: [ self error: 'I can''t find a .git/config file.' ].
	
	^ { 
		root. 
		String streamContents: [ :stream | subDir asStringOn: stream delimiter: $/ ] }