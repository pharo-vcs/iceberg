accessing
addChild: anObject
	children ifNil: [ children := OrderedCollection new ].
	children add: anObject.
	anObject parent: self.
	^ anObject