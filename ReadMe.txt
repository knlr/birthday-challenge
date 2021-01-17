How to install and run

Open the Birthday.xcodeproj and use Product -> Run


Technical Choices and reasoning

API
I've chosen to use the GraphQL API as the other API seems to be unavailable. My first approach was to use the Swift_GraphQL library I found through Cocoapods. Once I got that up and running I was dissappointed it didn't support Codable. I looked at the implementation and figured it was quite simple to implement GraphQL from scratch for this small example. I prefer to avoid dependencies when possible, and for this tiny app, Swift_GraphQL seemed overkill anyways.

UI
I've chosen SwiftUI as it's the future of native iOS app development and a good opportunity to demonstrate my skills (albeit still limited) with this new framework.
