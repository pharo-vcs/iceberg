API-remotes
fetch
	"Fetch all commits and branches from all remotes"
	self remotes do: [ :each | each fetch ]