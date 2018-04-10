accessing
rowHeight
	^ rowHeight ifNil: [ rowHeight := self class defaultRowHeight ]