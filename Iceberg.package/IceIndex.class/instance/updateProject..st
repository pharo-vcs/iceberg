as yet unclassified
updateProject: newProject

	"Optimization, only do this if it changes"
	| oldProject |
	1halt.
	oldProject := self repository headCommit project.
	oldProject
		removeFrom: repository workingCopy;
		addToIndex: self.
	newProject
		storeIn: repository workingCopy;
		addToIndex: self.