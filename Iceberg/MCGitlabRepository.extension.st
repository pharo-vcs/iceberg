Extension { #name : 'MCGitlabRepository' }

{ #category : '*Iceberg' }
MCGitlabRepository >> httpsUrl [
	^ 'https://<1s>/<2s>.git' expandMacrosWith: self hostname with: projectPath
]

{ #category : '*Iceberg' }
MCGitlabRepository >> scpUrl [
	"If the sshPort is not nil it means that we have a non default ssh port. Thus we need to add `ssh://` and th port number to the scheme"

	^ self sshPort
		ifNil: [ 'git@<1s>:<2s>.git' expandMacrosWith: self hostname with: projectPath ]
		ifNotNil: [ :port | 'ssh://git@<1s>:<2s>/<3s>.git' expandMacrosWith: self hostname with: port with: projectPath ]
]
