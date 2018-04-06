accessing
remoteModel
	^ repositoryModel remoteModels detect: [ :e | e entity = self remote ]