accessing
toolbarItemFont
	^ toolbarItemFont ifNil: [ toolbarItemFont := self newToolbarItemFont ]