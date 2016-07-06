private
versionsFor: package
	^ self versions 
		at: package packageName 
		ifAbsent: [ self error: ('Package {1} is not found in repository {2}'
			format: { package. self }) ]