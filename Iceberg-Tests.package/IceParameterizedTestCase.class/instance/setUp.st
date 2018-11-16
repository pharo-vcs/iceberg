running
setUp
	super setUp.
	oldShareRepositoriesBetweenImages := IceLibgitRepository shareRepositoriesBetweenImages.
	IceLibgitRepository shareRepositoriesBetweenImages: false.
	self parameters do: #activate