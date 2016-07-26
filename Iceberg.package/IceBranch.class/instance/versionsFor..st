versions
versionsFor: package 
	^ self versionDictionary  
		at: package name 
		ifAbsent: [ self error: ('Package {1} is not found in branch {2} of repository {3}' 
			format: { package. self name. repository }) ]