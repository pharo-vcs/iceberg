private 
fileFor: aRepository
	"I keep .properties at the root"
	^ aRepository backend codeDirectory / '.properties'