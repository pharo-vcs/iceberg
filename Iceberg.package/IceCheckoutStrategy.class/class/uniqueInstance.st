instance creation
uniqueInstance
	self = IceCheckoutStrategy ifTrue: [
		self error: 'I''m an abstract class. Use one of my children' ].
	^ uniqueInstance ifNil: [ uniqueInstance := self basicNew initialize ]