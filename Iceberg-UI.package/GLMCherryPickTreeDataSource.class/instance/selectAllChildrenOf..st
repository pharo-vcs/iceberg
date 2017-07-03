private
selectAllChildrenOf: item
	(self withAllChildrenOf: item) 
		do: [ :each | selection add: each data ]