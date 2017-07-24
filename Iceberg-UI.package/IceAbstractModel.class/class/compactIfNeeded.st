private
compactIfNeeded
	self models size > 250 ifFalse: [ ^ self ].
	"it looks like rehash will do what I need :)"
	modelCache rehash