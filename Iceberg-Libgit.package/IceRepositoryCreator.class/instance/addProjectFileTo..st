private
addProjectFileTo: aRepository
	
	| newProject |
	newProject := IceProject new.
	newProject sourceDirectory: self subdirectory.
	aRepository workingCopy project: newProject.