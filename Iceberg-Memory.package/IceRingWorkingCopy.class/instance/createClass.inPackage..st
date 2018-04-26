helpers
createClass: className inPackage: packageName
	
	self
		createClass: className
		inPackage: packageName
		with: [ :class | class superclass name: 'Object' ]