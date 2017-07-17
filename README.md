# AppModules
 
## Overview

AppModules addresses the problem of distributed development in environments where a common repository is impossible for legal 
or practical reasons.  Developers can create, maintain, and test Modules which can be incorporated easily into other applications
by those other applications' developers.  The relationship between a Module and its application, or between Modules within
an application, is loosely modeled upon the REST pattern.  A Module is addressable by its containing application (or by other 
modules) using HTTP verbs (currently GET is implemented).

A containing application mounts modules using the `ModuleConnector` class.  This class is included in the library so that 
developers can easily build simple container apps to test their modules.  An example of such a test application is included
in the library.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

AppModules is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "AppModules"
```

## Usage

### To create a module for incorporation into another app:
- Your module should expose a public class which conforms to the `ModuleType` protocol.
- Your ModuleType implementation should respond to `get()` requests with the resources (ViewControllers, data, etc) that it is intended to provide.  One planned enhancement is to introduce typing and avoid having return types of `Any?` but for a proof of concept this should be sufficient.

### To mount modules into your app:
- Your app should contain an instance of the `ModuleConnector` class
- Your `ModuleConnector` instance should instantiate and mount, at launch, the module(s) you intend to consume

## Authors

Michael Chaffee (mchaffee@thoughtworks.com) and Lily Evans (levans@thoughtworks.com)

## License

AppModules is available under the Apache license. See the LICENSE file for more info.
