private
fileNameForMethod: aMethod
	| path |
	
	path := OrderedCollection new.
	self repository subdirectory 
		ifNotEmpty: [ :subDir | path add: subDir ].
	path 
		add: (self cypressPackageName: aMethod package);
		add: (self cypressClassOrTraitName: aMethod);
		add: (self cypressMethodSideName: aMethod);
		add: (self cypressMethodName: aMethod).
	
	^ String streamContents: [ :stream |
		path asStringOn: stream delimiter: '/' ]