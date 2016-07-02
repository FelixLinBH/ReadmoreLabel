# ReadMoreLabel

[![Version](https://img.shields.io/cocoapods/v/ReadMoreLabel.svg?style=flat)](http://cocoapods.org/pods/ReadMoreLabel)
[![License](https://img.shields.io/cocoapods/l/ReadMoreLabel.svg?style=flat)](http://cocoapods.org/pods/ReadMoreLabel)
[![Platform](https://img.shields.io/cocoapods/p/ReadMoreLabel.svg?style=flat)](http://cocoapods.org/pods/ReadMoreLabel)

Customization UILabel tail string.

## How to Use?

###It provides:

* **Append tail string with color**

```
-(void)appendTailString:(NSString *)tailString color:(UIColor *)color;
```

* **Append tail string with color and font**

```
-(void)appendTailString:(NSString *)tailString color:(UIColor *)color font:(UIFont *)font;
```
* **Enable trim escape character flag**

```
@property (nonatomic,assign) BOOL isTrimEscapeCharacter;
```

##Screen shot

![Editor preferences pane](https://github.com/FelixLinBH/ReadmoreLabel/blob/master/ScreenShot.png?raw=true)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

ReadMoreLabel is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ReadMoreLabel"
```

## License

ReadMoreLabel is available under the MIT license. See the LICENSE file for more info.
