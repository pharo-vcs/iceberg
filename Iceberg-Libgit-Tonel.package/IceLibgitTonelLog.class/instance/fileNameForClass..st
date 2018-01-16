private
fileNameForClass: aClass
	| path |
	
	path := OrderedCollection new.
	self repository subdirectory 
		ifNotEmpty: [ :subDir | path add: subDir ].
	path add: aClass package name.
	path add: (self tonelClassOrTraitName: aClass).
	
	^ String streamContents: [ :stream |
		path asStringOn: stream delimiter: '/' ]