accessing
model
	^ model ifNil: [ model := self createModel ]