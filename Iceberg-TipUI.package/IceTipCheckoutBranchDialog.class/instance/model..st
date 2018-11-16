accessing
model: anObject
	model := anObject.
	self allTypes do: [ :each | each model: anObject ]