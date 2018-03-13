accessing
name

	^ name ifNil: [ self obtainRepositoryName ]