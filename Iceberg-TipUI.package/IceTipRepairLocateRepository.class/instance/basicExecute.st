executing
basicExecute
	| dialog |
	dialog := IceTipLocalRepositoryPanel new
		location: self repository location;
		subdirectory: self repository subdirectory;
		yourself.
	dialog openDialogWithSpec 
		okAction: [ 
			[ 
				dialog validate.
				self repositoryModel
					updateLocation: dialog location 
					subdirectory: dialog subdirectory.
				Iceberg announcer announce: (IceRepositoryModified for: self repository).
				true ]
			on: AssertionFailure 
			do: [ :e | 
				UIManager default 
					alert: e messageText 
					title: 'Error'.
				false ] ]