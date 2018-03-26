I'm the simplest possible checkout strategy: I will load into image all packages defined in repository regardless their previous status. 

This strategy is very dangerous since it can introduce in image package versions that were not there before. Or it may cause the packages/classes became incorrectly initialised. But some project can find this strategy very apeleable nevertheless.