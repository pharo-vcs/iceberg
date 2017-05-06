private
changedPackages
	"Here I have to build the fake packages with the cherryPicked."
	| picked snapshot |
	cherryPickBlock ifNotNil: [ picked := cherryPickBlock value ].
	picked ifNil: [ ^ super changedPackages ].
	snapshot := MCSnapshot fromDefinitions: picked.
	self error: 'TODO'