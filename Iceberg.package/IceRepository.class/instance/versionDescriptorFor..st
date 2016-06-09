versions handling
versionDescriptorFor: aVersionInfo 
	^ self allVersionDescriptors detect: [ :entry | entry info = aVersionInfo ]