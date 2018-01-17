API-changes
diffToParent
	"returns a diff between me and my first parent/ancestor"
	^ self diffTo: (self ancestors
			ifNotEmpty: #first
			ifEmpty: [ nil ])