testing
isCodeSubdirectory: aNode
	| nodePathString |
	self flag: #clean. "
	This is a hack for Pharo 6.1 because representation of paths changed between Pharo 6.1 and Pharo 7.
	When Pharo 6.1 will not be maintaned anymose this method can be changed for: 
	
	`^ aNode path pathString = self repository subdirectory`.
	
	"
	
	nodePathString := aNode path pathString.
	(nodePathString isNotEmpty and: [ nodePathString first = $/ ]) ifTrue: [ nodePathString := nodePathString allButFirst ].
	
	^ nodePathString = self repository subdirectory