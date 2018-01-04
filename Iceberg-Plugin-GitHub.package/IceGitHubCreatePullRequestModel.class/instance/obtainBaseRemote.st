private
obtainBaseRemote
	| base |
	base := self gitBase.
	^ IceGitRemote url: ((base at: #'git_url') copyReplaceAll: 'git://' with: 'https://')