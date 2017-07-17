accessing
children
	^ self branches collect: [ :branch | IceBranchModel parent: self branch: branch ]