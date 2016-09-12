walking
commits
	^ self commitIds collect: [ :id | self repository frontend commitAt: id ]	