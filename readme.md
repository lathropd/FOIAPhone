# FOIA Phone

FOIA Phone is an iPhone (eventually supporting other Apple devices) app
for creating open records requests on the fly.

Build using a Model-View-Acto pattern where the main App and
a main NavigationStack act as the Coordinator and Services are
extracted for "stateless" actions like database and cloud sync 
operations.

- Views can call Actors and use Models
- Actors can call Services and use Models
- Services can use Models. Currently for accessing resources. But may actually
  be the right place for business logic. See also microservices architectures.
- Coordinator handles global state and view coordination 

Considering calling this "SAVE" (Services-Actors-Views-Entities) with most
"business logic" contained in services rather than the data objects.

This makes use of structs rather than objects for passing data in order to 
avoid as much global state as possible.

Trying ideas out for the creation of a framework for Swift apps should
I keep building these. Because I miss the structure that Dajngo, Rails, etc.,
gives to the development process.

(c) 2025 Daniel Lathrop
