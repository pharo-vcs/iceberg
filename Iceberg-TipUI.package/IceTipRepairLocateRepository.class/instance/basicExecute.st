executing
basicExecute
	| dialog |
	dialog := IceTipLocalRepositoryPanel new
		location: (self repository location ifNil: [ self defaultLocation ]);
		subdirectory: self repository subdirectory;
		yourself.
	dialog openDialogWithSpec 
		okAction: [ 
			[ 
				dialog validate.
				self repositoryModel
					updateLocation: dialog location 
					subdirectory: dialog subdirectory.
				true ]
			on: AssertionFailure 
			do: [ :e | 
				UIManager default 
					alert: e messageText 
					title: 'Error'.
				false ] ]