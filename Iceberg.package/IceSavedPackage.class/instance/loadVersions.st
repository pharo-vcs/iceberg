private
loadVersions
	^ self repository backend lookupVersionsOfPackage: self
