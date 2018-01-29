querying
theirSnapshot: package 
	^ theirVersion ifNotNil: [ 
		[theirVersion snapshotFor: package] on: IceVersionDoesNotExist do: [ MCSnapshot empty ] ]