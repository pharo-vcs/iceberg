private
internalStoreVersion: aVersion
	"Inspired on MCFileTreeGitRepository."
	"Do a filetree store followed by a git add command, do not commit yet."
	"Writer is metadata dependent."

	| packageDirectoryString |

	MCFileTreeGitWriter fileOut: aVersion on: self.

	packageDirectoryString := aVersion package name , self packageExtension.
	self command: { 'add'. packageDirectoryString }
