building
ensureGroup: menuGroupClass

	| parentGroup group |
	rootGroup class = menuGroupClass ifTrue: [ ^rootGroup ].
	rootGroup findGroupLike: menuGroupClass ifExists: [:existing | ^existing].
	
	parentGroup := self ensureGroup: menuGroupClass parentGroup.
	group := menuGroupClass new.
	parentGroup addItem: group.
	^group