API-accessing
name

	^ name ifNil: [ name := self obtainRepositoryName ]