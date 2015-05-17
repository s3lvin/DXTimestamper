# DXTimestamper

[![Version](https://img.shields.io/cocoapods/v/DXTimestamper.svg?style=flat)](http://cocoapods.org/pods/DXTimestamper)
[![License](https://img.shields.io/cocoapods/l/DXTimestamper.svg?style=flat)](http://cocoapods.org/pods/DXTimestamper)
[![Platform](https://img.shields.io/cocoapods/p/DXTimestamper.svg?style=flat)](http://cocoapods.org/pods/DXTimestamper)

## Usage

To run the example project, clone the repo, and run the example project. Please open the workspace not just the project.

#### Integrating `DXTimestamper` in your project

#### Features packed
1. You can use `DXTimestampLabel` for showing fuzzy timestamps instead of UILabels
2. You can also use `DXTimestampButton` for showing fuzzy timestamps instead of UIButtons. This gives you flexibility to add custom image as shown in the screenshot, or to implement button events.
3. The default timestamp will be represented by one of the following entries:
    1. now => rightnow
    2. (n) s => n seconds
    3. (n) m => n minutes
    4. (n) h => n hours
    5. (n) d => n days
    6. (n) w => n weeks

#### configuration

1. Change the class of the `UILabel` to `DXTimestampLabel` and change the class of `UIButton` to `DXTimestampButton` in storyboard. 
2. Assign a `NSDate` object to `timestamp` property of the `DXTimestampLabel` or `DXTimestampButton`
3. Timestamp will updated for each second. This works for past time as well as future time.

#### Using Custom fuzzy logic

You can set your own fuzzy timestamp calculation logic like this

    [DXTimestamper setFuzzyTimestampCalculator:^NSString *(NSDate *timestamp) {
        // do fuzzy timestamp calculations and return the fuzzy time string
        return @"";
    }];
  
The above configuration is global as of now. You need to call it before using any instance that conform to `<DXTimestamping>`. If you want to have this logic to be configurable for each individual instance of `<DXTimestamping>` objects then just raise an issue. I will try to work on that.

## Screenshot

![DXCustomCallout](http://s26.postimg.org/smgiqhmw9/Timestamp.gif)

## Requirements

* iOS 7 or above
* Requires ARC

## Installation

DXTimestamper is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "DXTimestamper"
```

## Author

s3lvin, mariaselvin@gmail.com

## Notes

If you want more `UIKit` components to be supported by `DXTimestamping` either raise an issue. Pull requests are also welcome! Thanks for using `DXTimestamper`. Happy coding :)

## License

DXTimestamper is available under the MIT license. See the LICENSE file for more info.
