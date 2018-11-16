private
addProjectFileTo: aRepository
	
	| newProject |
	newProject := IceBasicProject onRepository: aRepository.
	newProject sourceDirectory: self subdirectory.
	aRepository workingCopy basicSetProject: newProject.