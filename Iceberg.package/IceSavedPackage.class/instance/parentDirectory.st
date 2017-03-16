accessing
parentDirectory

	^ self subdirectory isEmptyOrNil
		ifTrue: [ self repository backend repositoryDirectory ]
		ifFalse: [ self repositoryDirectory, self subdirectory ]
	
