initialize local repository
location: repositoryDirectory subdirectory: codeDirectoryName
	"repositoryDirectory is a file reference pointing to the directory where the git repo will be located. 
	codeDirectoryName is a string with the name of the directory in the repository where the Pharo code lies. The rest of the repository will not be handled by this object."
	
	subdirectory := (codeDirectoryName ifNil: '').
	
	"Modify directly the directory variable because accessor expects that the repository is already created, which could not be the case. Such validation will be done later, in the #validate method."
	directory := codeDirectoryName isEmptyOrNil
		ifTrue: [ repositoryDirectory ]
		ifFalse: [ repositoryDirectory / codeDirectoryName ].
