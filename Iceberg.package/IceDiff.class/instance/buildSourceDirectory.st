building
buildSourceDirectory
	
	"If there is no subdirectory, put it in the root, myself"
	| newDirectory |
	newDirectory := self repository subdirectory
		ifEmpty: [ tree ]
		ifNotEmpty: [ self builder ensureDirectoryNamed: self repository subdirectory ].

	sourceDirectory := newDirectory
		beSourceDirectory;
		yourself