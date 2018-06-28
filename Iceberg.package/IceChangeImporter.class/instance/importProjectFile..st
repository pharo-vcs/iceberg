project
importProjectFile: project

	"If the project is unborn this means the file does not exist, do not add it to the tree"
	| projectFilePath projectFileName |
	project isUnbornProject ifTrue: [ ^ self ].
	
	projectFilePath := project projectFilePath.
	self assert: projectFilePath size = 1.
	
	projectFileName := projectFilePath segments first.
	parentNode addChild: (IceFileDefinition named: projectFileName path: projectFilePath contents: project contentsString).