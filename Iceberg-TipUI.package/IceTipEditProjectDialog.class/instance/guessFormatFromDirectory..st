format-management
guessFormatFromDirectory: aFileReference 
	
	"We take as guinea pig a sub-directory to guess what format it is on.
	In case the current directory has no children directories, we just select the default format"
	| guineaPig |
	guineaPig := aFileReference children detect: [ :any | any isDirectory ] ifNone: [ ^ defaultFormat ].
	
	"Filetree must have precedence as it has the most restrictive name convention (directories ending with .package)"
	((formats includes: IceLibgitFiletreeWriter)
		and: [ IceLibgitFiletreeWriter isValidPackageName: guineaPig basename ])
			ifTrue: [ ^ IceLibgitFiletreeWriter ].
	
	"Otherwise go with the entire list"
	^ formats
		detect: [ :each | each isValidPackageName: guineaPig basename ]
		ifNone: [ ^ defaultFormat ].