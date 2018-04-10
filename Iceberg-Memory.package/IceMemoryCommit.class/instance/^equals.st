comparing
= aCommit

	^ (self mcCommit dependencies asArray sort: [ :a :b | a timeStamp > b timeStamp ])
			= (aCommit mcCommit dependencies asArray sort: [ :a :b | a timeStamp > b timeStamp ])