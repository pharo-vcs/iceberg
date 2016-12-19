adding
addFilesToIndex: aListOfPaths 
	"Do not run the command in codeDirectory. We want to add files to the index that are outside the code directory!"
	^ IceGitCommand 
		in: self repositoryDirectory
		execute: { 'add' . aListOfPaths }
