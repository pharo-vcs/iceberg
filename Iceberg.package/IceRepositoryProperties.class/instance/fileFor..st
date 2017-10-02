accessing
fileFor: aRepository
	"I keep .properties at the root"
	^ aRepository backend codeDirectory / self class propertiesFileName