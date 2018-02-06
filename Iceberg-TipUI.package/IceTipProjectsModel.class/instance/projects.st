accessing
projects
	^ projects ifNil: [ projects := self createProjectModels ]