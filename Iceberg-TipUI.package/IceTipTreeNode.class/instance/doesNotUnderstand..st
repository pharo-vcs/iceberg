reflective operations
doesNotUnderstand: aMessage
	"redirect to model to provide polymorphism."
	self flag: #todo. "I'm not sure this is good practice... we'll see how it works"
	self model ifNil: [ ^ super doesNotUnderstand: aMessage ].
	^ aMessage sendTo: self model