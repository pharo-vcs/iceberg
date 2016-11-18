comparing
isSameUrl: another
	^ (self url withoutSuffix: '.git') = (another url withoutSuffix: '.git')