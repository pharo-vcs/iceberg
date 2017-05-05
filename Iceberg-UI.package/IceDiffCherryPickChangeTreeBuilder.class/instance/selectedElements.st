accessing
selectedElements
	^ selectedElements ifNil: [ selectedElements := self elements asSet ]