accessing
setLongpaths: aBoolean global: globalBoolean 
	"set user.name and user.email properties. 
	 this could be a nonsense with other backends, but git has them and needs them :)"
	self withRepoDo: [ :repo | | config |
		config := repo config.
		globalBoolean ifTrue: [ config := config openGlobal ].
		config setBoolean: 'core.longpaths' to: aBoolean ]