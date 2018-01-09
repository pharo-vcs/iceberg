comparing
hash

	self mcCommit dependencies isEmpty ifTrue: [ ^ 0 hash ].
	self mcCommit dependencies size = 1 ifTrue: [ 
		^ self mcCommit dependencies anyOne hash ].
	
	"Fold only works for collection of >=2 elements"
	^ (self mcCommit dependencies asArray sort: [ :a :b | a timeStamp > b timeStamp ])
			fold: [ :a :b | a hash bitXor: b hash ]