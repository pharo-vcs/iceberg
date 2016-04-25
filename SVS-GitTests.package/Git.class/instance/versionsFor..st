versions handling
versionsFor: packageName
	^ self allVersionDescriptors select: [ :version | version packageName = packageName ]
