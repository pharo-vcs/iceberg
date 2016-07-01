auxiliar
defaultLocationForLocalClonedRepository
	^ ('iceberg-cache/local/{1}' format: { projectName }) asFileReference.
