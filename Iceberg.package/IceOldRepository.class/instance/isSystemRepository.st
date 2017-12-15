testing
isSystemRepository
	"Indicated if this repository is a system repository (for example, 'pharo' itself).
	 This is useful because we do not want to treat all repositories the same. System 
	 repositories, although present, shouldn't be visible by default (unless desired), 
	 for example"
	^ system