as yet unclassified
mcVersion
	^ entry 
		ifNotNil: [ self repository backend versionFromFileNamed: entry ] 
		ifNil: [ self shouldBeImplemented ]