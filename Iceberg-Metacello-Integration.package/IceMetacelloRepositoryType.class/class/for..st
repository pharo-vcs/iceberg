instance creation
for: aLocationString
	^ (self allTypes
		detect: [ :each | each isSuitableForLocation: aLocationString ])
		location: aLocationString