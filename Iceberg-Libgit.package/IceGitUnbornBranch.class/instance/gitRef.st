accessing
gitRef
	"When the repository is unborn, the repository has a single ref that points to no commits.
	The HEAD file then contains some content such as:
	
		ref: refs/heads/[branch_name]
	"

	^ ((repository location / '.git' / 'HEAD') contents withoutPrefix: 'ref: ') trimBoth