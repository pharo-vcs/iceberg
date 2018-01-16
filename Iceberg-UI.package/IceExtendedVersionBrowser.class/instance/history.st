accessing
history
	^ history ifNil: [ history := self repository log historyOfMethod: self method ]