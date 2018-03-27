private
doAccept
	| newRepository |
	
	self selectedType validate.
	newRepository := self selectedType newRepository.
	self isEditing 
		ifTrue: [ self doEdit: newRepository ]
		ifFalse: [ newRepository register ].
	acceptBlock ifNotNil: [ 
		acceptBlock cull: self ]