tests
testNotLoadedStatusHasDescription

	| status |
	status := IceNotLoaded on: repository.
	self assert: status shortDescription equals: 'Not loaded'.
	self assert: status longDescription equals: 'This repository is not loaded into the image. Select what to load to create a working copy.'.