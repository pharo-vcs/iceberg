initialization
invalidateOn: announcementType from: announcer
	announcer weak subscribe: announcementType do: [ lastUpdated := nil ] 
