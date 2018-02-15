accessing
sourceDirectory
	
	"If there is no subdirectory, put it in the root, myself"
	self repository subdirectory ifEmpty: [ ^ self ].
	
	^ self buildDirectoryNamed: self repository subdirectory