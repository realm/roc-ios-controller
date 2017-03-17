# ROCController

[![CI Status](http://img.shields.io/travis/mbalex99/ROCController.svg?style=flat)](https://travis-ci.org/mbalex99/ROCController)
[![Version](https://img.shields.io/cocoapods/v/ROCController.svg?style=flat)](http://cocoapods.org/pods/ROCController)
[![License](https://img.shields.io/cocoapods/l/ROCController.svg?style=flat)](http://cocoapods.org/pods/ROCController)
[![Platform](https://img.shields.io/cocoapods/p/ROCController.svg?style=flat)](http://cocoapods.org/pods/ROCController)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

ROCController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ROCController"
```

## Tutorial 

1. Whenever you need ROCController just make sure you `import ROCController`
2. If you need a special sort of ChatMessage, you can subclass `ROCBaseChatMessage`. But you're free to use it right out of the box

Important `ROCController` just observes a `Result<T: ROCBaseChatMessage>`. Out of the box it doesn't tell you how you should add messages. Most implementations will prefer appending chat messages. No where does it actually call `try! myRealm.write`. You can do that anywhere you want.

## FAQ

### The example project has a few different depedencies. Do I need them?
No absolutely not, they're just to show that you can use a whole lot of other code with ROCController with minimal intrusion. 


## Author
**Maximilian Alexander**

Contact: 
* @mbalex99
* mbalex99@gmail.com
* max.alexander@realm.io

## License

ROCController is available under the MIT license. See the LICENSE file for more info.
