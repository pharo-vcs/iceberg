private
withAllChildrenOf: item
	^ item children
		inject: { item }
		into: [ :all :each | all, (self withAllChildrenOf: each) ]