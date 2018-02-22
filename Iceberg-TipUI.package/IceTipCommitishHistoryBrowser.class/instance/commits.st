accessing
commits
	^ self model
		ifNotNil: #commits
		ifNil: [ #() ]