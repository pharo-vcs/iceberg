I'm a browser to show all history of a method.

Example: 

(self 
	repository: (IceRepository registry detect: [ :each | each name = 'pharo' ]) 
	method: Object>>#instVarAt:) 
	open.