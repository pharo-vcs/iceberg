accessing
selectAllWithChildren: aCollection
	selection := Set new.
	aCollection do: [ :each | self selectAllChildrenOf: each ]