private
addProjectFileTo: aRepository
	
	| newProject |
	newProject := IceProject onRepository: aRepository.
	newProject sourceDirectory: self subdirectory.
	aRepository workingCopy project: newProject.