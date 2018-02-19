accessing
buildSourceDirectory
	
	"If there is no subdirectory, put it in the root, myself"
	| newDirectory |
	newDirectory := self repository subdirectory
		ifEmpty: [ tree ]
		ifNotEmpty: [ 
			(IceDiffNodeBuilder new
				diff: self;
				parentNode: tree;
				yourself) ensureDirectoryNamed: self repository subdirectory.
	].

	sourceDirectory := newDirectory
		beSourceDirectory;
		yourself