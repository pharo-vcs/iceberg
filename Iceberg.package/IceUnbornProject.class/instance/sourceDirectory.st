accessing
sourceDirectory

	"Tricky method.
	If we are in an unborn project, it means the user has not configured meta-data on it yet.
	In that case, return the empty source directory"
	^ ''