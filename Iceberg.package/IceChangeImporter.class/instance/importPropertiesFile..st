project
importPropertiesFile: versionProject

	"Always create a properties file"
	| propertiesFilePath propertiesParentNode propertiesFileName |
	versionProject repositoryProperties isUnborn
		ifTrue: [ ^ self ].
	
	propertiesFilePath := versionProject propertiesFilePath.
	propertiesParentNode := parentNode.
	propertiesFilePath segments allButLastDo: [ :each | 
		propertiesParentNode := (propertiesParentNode includesKey: each)
			ifTrue: [ propertiesParentNode / each ]
			ifFalse: [ propertiesParentNode addChild: (IceDirectoryDefinition named: each) ].
		self assert: propertiesParentNode value isDirectoryDefinition ].
	
	propertiesFileName := propertiesFilePath segments last.
	propertiesParentNode addChild: (IceFileDefinition named: propertiesFileName path: propertiesFilePath contents: versionProject repositoryProperties contentsString)