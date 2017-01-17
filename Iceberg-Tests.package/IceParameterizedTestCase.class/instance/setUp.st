running
setUp
	oldShareRepositoriesBetweenImages := IceRepository shareRepositoriesBetweenImages.
	IceRepository shareRepositoriesBetweenImages: false.
	self testParameters do: #activate.
	
