initialization
initialize
	super initialize.
	self
		childrenBlock: [ :each | self childrenFor: each];
		icon: [ :each | self iconFor: each ];
		format: #descriptionWithDecoration