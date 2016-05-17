versions handling
versionsFor: package
	^ self allVersionDescriptors select: [ :version | version packageName = package name ]
