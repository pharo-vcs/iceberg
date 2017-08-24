instance creation
modelFor: entity
	| model |
	"We are using a WeakSet for keeping models because using a dictionary (sorted by 
	 name) has problems when cleaning. This should be efficient enough, but we'll see."
	model := self models 
		detect: [ :each | each notNil and: [ each entity name = entity name ] ] 
		ifNone: [ nil ].
	^ model ifNil: [ 
		self compactIfNeeded.
		self models add: (self basicNew 
			entity: entity; 
			initialize; 
			yourself) ]