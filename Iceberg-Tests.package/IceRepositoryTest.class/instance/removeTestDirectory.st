auxiliar
removeTestDirectory
	| directory |
	directory := 'pharo-git-test' asFileReference.
	directory exists ifTrue: [directory deleteAll].
