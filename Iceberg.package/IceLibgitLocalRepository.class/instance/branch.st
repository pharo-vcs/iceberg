accessing
branch
	^ branch ifNil: [ branch := 'master' ]