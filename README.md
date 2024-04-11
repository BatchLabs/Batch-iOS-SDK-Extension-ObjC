# Batch SDK - iOS (Objective-C Extension)

>Note: As Swift is now common in all apps and required by Batch, this extension should only be used if `https://github.com/BatchLabs/Batch-iOS-SDK-Extension.git` cannot be used. Even if your extension code is ObjC, you should be able to use the other extension code.

This repository contains Batch's iOS Extension SDK.

It is a light version that only uses Extension-safe APIs for extension-specific features.

The project is written in Objective-C. You should use this variant if you do not want to bundle the Swift runtime in your app on iOS versions lower than 12.4.

## Requirements

- iOS 12 and higher

## Integration

This extension should be added to your Notification Service Extension. If you don't have one, please see [our documentation](https://doc.batch.com/ios/sdk-integration/rich-notifications-setup).

You will also need to configure an app group shared by your extension and app. See our [tutorial here](https://doc.batch.com/ios/advanced/app-groups).

### Cocoapods

pod 'BatchExtension-ObjC'

### Carthage

github "BatchLabs/Batch-iOS-SDK-Extension-ObjC"

### Swift Package Manager

_Requires Xcode 15_

Add https://github.com/BatchLabs/Batch-iOS-SDK-Extension-ObjC.git as a dependency, and add it to your Extension target.
You do not need to add this package to your main target.
