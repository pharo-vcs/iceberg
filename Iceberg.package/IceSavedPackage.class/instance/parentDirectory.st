accessing
parentDirectory

	^ self subdirectory isEmptyOrNil
		ifTrue: [ self repository backend repositoryDirectory ]
		ifFalse: [ self repository backend repositoryDirectory / self subdirectory ]