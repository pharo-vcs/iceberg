as yet unclassified
mcVersion
	self halt.
	^ mcVersion ifNil: [ mcVersion := self package workingCopy loadedVersion ]