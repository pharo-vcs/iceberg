visiting
visitProjectChange: anIceProjectChange 
	
	| projectFilePath projectFileName propertiesFilePath propertiesFileName propertiesParentNode |
	"If the project is unborn it means there is no file there"
	version project isUnbornProject ifTrue: [ ^ self ].
	
	projectFilePath := version project projectFilePath.
	self assert: projectFilePath size = 1.
	projectFileName := projectFilePath segments first.
	parentNode addChild: (IceFileDefinition named: projectFileName path: projectFilePath contents: version project contentsString).
	
	propertiesFilePath := version project propertiesFilePath.
	self assert: propertiesFilePath size <= 2.
	propertiesParentNode := parentNode.
	propertiesFilePath segments allButLastDo: [ :each | 
		propertiesParentNode := (propertiesParentNode includesKey: each)
			ifTrue: [ propertiesParentNode / each ]
			ifFalse: [ propertiesParentNode addChild: (IceDirectoryDefinition named: each) ].
		self assert: propertiesParentNode value isDirectoryDefinition ].
	
	propertiesFileName := propertiesFilePath segments last.
	propertiesParentNode addChild: (IceFileDefinition named: propertiesFileName path: propertiesFilePath contents: version project repositoryProperties contentsString)