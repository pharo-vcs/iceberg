reflective operations
doesNotUnderstand: aMessage
	"redirect to model to provide polymorphism."
	self flag: #todo. "I'm not sure this is good practice... we'll see how it works"
	^ aMessage sendTo: self model