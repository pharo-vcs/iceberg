as yet unclassified
allVersionDescriptors
	^ self repository allVersions select: [ :each | each commitId = self commitId ]
