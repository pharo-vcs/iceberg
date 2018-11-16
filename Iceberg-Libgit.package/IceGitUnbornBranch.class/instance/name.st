accessing
name
	"Remove the refs/heads prefix from the full branch name"
	^ self gitRef withoutPrefix: self branchNamePrefix