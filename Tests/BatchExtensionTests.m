//
//  BatchExtensionTests.m
//  BatchExtensionTests
//
//  Copyright © 2020 Batch. All rights reserved.
//

#import <XCTest/XCTest.h>

@import BatchExtension;

@interface BAERichNotificationAttachment : NSObject

@property (nonnull) NSURL *url;
@property (nonnull) NSString *type;

@end

@interface BAERichNotificationHelper()
- (BAERichNotificationAttachment*)attachmentForPayload:(NSDictionary*)userInfo;
@end

@interface BatchExtensionTests : XCTestCase

@end

@implementation BatchExtensionTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testURLExtraction {
    NSString *validURL = @"https://batch.com/foo.png";
    NSString *validType = @"image/png";
    
    NSDictionary *validPayload = @{
        @"com.batch": @{@"at": @{@"u": validURL, @"t": validType}}
    };
    
    NSDictionary *invalidURLPayload = @{
        @"com.batch": @{@"u": @"foobar$", @"t": validType}
    };
    
    NSArray<NSDictionary *> *missingPayloads = @[
        @{},
        @{@"foo": @"bar"},
        @{@"com.batch":@{@"foo": @"bar"}},
        @{@"com.batch":@{@"at": @{}}},
        @{@"com.batch":@{@"at": @{@"foo": @"bar"}}},
        @{@"com.batch":@{@"at": @{@"u": @"https://batch.com/favicon.ico"}}},
        @{@"com.batch":@{@"at": @{@"t": @"image/jpeg"}}}
    ];
    
    BAERichNotificationHelper *helper = [BAERichNotificationHelper new];
    BAERichNotificationAttachment *attachment = [helper attachmentForPayload:validPayload];
    
    XCTAssert([[attachment url] isEqual:[NSURL URLWithString:validURL]]);
    XCTAssert([[attachment type] isEqual:validType]);
    XCTAssertNil([helper attachmentForPayload:invalidURLPayload]);
    
    for (NSDictionary *payload in missingPayloads) {
        XCTAssertNil([helper attachmentForPayload:payload]);
    }
}

@end
