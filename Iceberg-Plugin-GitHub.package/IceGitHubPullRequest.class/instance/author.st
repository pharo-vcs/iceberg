accessing
author
	^ (self jsonAt: 'user') at: 'login'