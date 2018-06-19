API-project
project
	
	"For backwards compatibility, if we don't find a project, take the project from HEAD"
	^ project ifNil: [ self refreshProjectFromRepository ]