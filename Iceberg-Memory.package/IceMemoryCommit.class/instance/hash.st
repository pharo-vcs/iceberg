comparing
hash

	^ (self mcCommit dependencies asArray sort: [ :a :b | a timeStamp > b timeStamp ])
			fold: [ :a :b | a hash bitXor: b hash ]