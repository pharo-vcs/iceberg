patches
updated
	| newVersion |
	newVersion := self package computeLoadedVersion.
	self package repository workingCopy versionLoaded: newVersion.
	^ newVersion