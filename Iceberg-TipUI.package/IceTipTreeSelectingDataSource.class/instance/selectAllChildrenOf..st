private
selectAllChildrenOf: item
	(self withAllChildrenOf: item) 
		do: [ :each | selectedItems add: each data ]