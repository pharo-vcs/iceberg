accessing
name
	^ name ifNil: [ name := self origin projectName ]