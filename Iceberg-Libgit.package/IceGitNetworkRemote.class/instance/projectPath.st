accessing
projectPath

	| projectPath |
	"Work on a copy of the path"
	projectPath := OrderedCollection withAll: self path.
	self owner ifNotNil: [ projectPath add: self owner ].
	projectPath add: self projectName.
	^ (RelativePath withAll: projectPath) pathString