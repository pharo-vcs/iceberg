merging
addDefinition: aNodeToAdd
	
	| node |
	node := self builder ensureNode: aNodeToAdd.
	1halt.
	operations at: node
		ifPresent: [  ]
		ifAbsent: [  ].
"		definitionLike: aDefinition
		ifPresent: [:other |
			(self removalForDefinition: aDefinition)
				ifNotNil:
					[:op |
					self addOperation: (MCModification of: other to: aDefinition).
					self removeOperation: op.
					^ self].
			other = aDefinition
				ifFalse: [self addConflictWithOperation: (MCModification of: other to: aDefinition)]
				ifTrue: [self redundantAdds add: aDefinition]]
		ifAbsent: [self addOperation: (MCAddition of: aDefinition)]"