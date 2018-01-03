running
setUp
	oldShareRepositoriesBetweenImages := IceRepository shareRepositoriesBetweenImages.
	IceRepository shareRepositoriesBetweenImages: false.
	self parameters do: #activate.
	
