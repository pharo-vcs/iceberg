repository handling
ensureLocalRepository
	"No branch name is provided, so if a git repository already exists at the defined location, 
	its current branch will be adopted. Else branch 'master' will be used."
	^ self ensureLocalRepository: nil