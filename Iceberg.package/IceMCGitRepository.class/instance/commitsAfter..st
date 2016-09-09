querying
commitsAfter: aCommit
	^ (self command: { 'log'. self branch. '--not'. aCommit id . '--format=%H' }) 
		trim lines
		collect: [ :id | self frontend commitAt: id ]		