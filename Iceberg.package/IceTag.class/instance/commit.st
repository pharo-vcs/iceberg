querying
commit
	^ commit ifNil: [ commit := self repository peelTag: self ]