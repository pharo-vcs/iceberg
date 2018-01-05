as yet unclassified
registry
	^ IceRepository registry collect: [ :repository | self modelFor: repository ]