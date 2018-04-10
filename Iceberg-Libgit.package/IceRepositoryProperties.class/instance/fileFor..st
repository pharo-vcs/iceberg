accessing
fileFor: aRepository
	"I keep .properties at the root"
	^ aRepository codeDirectory / self class propertiesFileName