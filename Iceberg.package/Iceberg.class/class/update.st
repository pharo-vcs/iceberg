updating
update
	{ self. LGitRepository. MCFileTreeGitRepository } 
		do: [:class | class package iceRepository pull ]