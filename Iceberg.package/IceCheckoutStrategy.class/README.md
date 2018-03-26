I'm a general strategy to perform checkouts. 
In Pharo, checkouts are a lot more complicated than a simple checkout in file system, since we have packages installed that corresponds with the commit of reference.
Doing a checkout then means also introduce new versions into the image, and there are different possible strategies to perform this task in a safe way. 
My children will implement method #checkoutPackagesOn: to perform this task.