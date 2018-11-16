class initialization
registerSystemAnnouncements

	self unregisterSystemAnnouncements.
	SystemAnnouncer uniqueInstance weak
		when: ClassAnnouncement send: #handleClassChange: to: self;
		when: MethodAnnouncement send: #handleMethodChange: to: self;
		when: ClassTagAnnouncement send: #handlePackageChange: to: self;
		when: MCVersionLoaderStopped send: #handleVersionLoaded: to: self.