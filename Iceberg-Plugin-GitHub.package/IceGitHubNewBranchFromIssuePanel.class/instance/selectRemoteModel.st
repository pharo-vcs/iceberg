accessing
selectRemoteModel

	^ selectRemoteModel ifNil: [
		selectRemoteModel := IceTipRemoteActionModel 
			repositoryModel: self model
			on: self model entity ]