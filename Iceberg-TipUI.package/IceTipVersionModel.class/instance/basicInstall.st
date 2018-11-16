private
basicInstall
	| definition |
	
	definition := self entity definition.
	definition realClass 
		compile: definition sourceCode
		classified: definition category	