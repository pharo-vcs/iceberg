querying
loadedVersion
	^ self versions detect: [ :version | version entry info = self package workingCopy versionInfo ]