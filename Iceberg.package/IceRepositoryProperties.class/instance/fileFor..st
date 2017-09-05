private 
fileFor: aRepository
	"I keep .properties at the root"
	^ aRepository location / '.properties'