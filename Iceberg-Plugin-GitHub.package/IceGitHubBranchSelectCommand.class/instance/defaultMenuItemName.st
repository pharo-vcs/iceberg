accessing
defaultMenuItemName
	^ remote ifNotNil: [ remote name , ' (' , remote url , ')' ] ifNil: [ self itemNameWithoutBranches ]