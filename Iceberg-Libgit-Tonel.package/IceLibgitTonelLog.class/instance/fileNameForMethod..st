private
fileNameForMethod: aMethod
	| path |
	
	path := OrderedCollection new.
	self repository subdirectory 
		ifNotEmpty: [ :subDir | path add: subDir ].
	path add: (self tonelPackageName: aMethod package).
	path add: (self tonelMethodClassOrTraitName: aMethod).
	
	^ String streamContents: [ :stream |
		path asStringOn: stream delimiter: '/' ]