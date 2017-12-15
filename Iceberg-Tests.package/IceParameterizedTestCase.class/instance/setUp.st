running
setUp
	oldShareRepositoriesBetweenImages := IceOldRepository shareRepositoriesBetweenImages.
	IceOldRepository shareRepositoriesBetweenImages: false.
	self parameters do: #activate.
	
