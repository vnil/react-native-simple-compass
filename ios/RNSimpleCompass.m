
#import "RNSimpleCompass.h"
#import "RCTEventDispatcher.h"
#import "RCTLog.h"
#import <Corelocation/CoreLocation.h>

#define kHeadingUpdated @"HeadingUpdated"

@interface RNSimpleCompass() <CLLocationManagerDelegate>
@property (strong, nonatomic) CLLocationManager *locationManager;
@end

@implementation RNSimpleCompass

- (instancetype)init {
    if (self = [super init]) {
        if ([CLLocationManager headingAvailable]) {
            self.locationManager = [[CLLocationManager alloc] init];
            self.locationManager.delegate = self;
            if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
                NSLog(@"Requesting permission");
                [self.locationManager requestWhenInUseAuthorization];
            }
        }
        else {
            NSLog(@"Heading not available");
        }
    }
    
    return self;
}

- (NSArray<NSString *> *)supportedEvents {
    return @[kHeadingUpdated];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
    [self sendEventWithName:kHeadingUpdated body:@"Event coming through"];
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [self.locationManager startUpdatingHeading];
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"Location manager failed: %@", error);
}

RCT_EXPORT_METHOD(start) {
    //TODO add possibility to pass settings like headingFilter
    self.locationManager.headingFilter = 5;
    [self.locationManager startUpdatingHeading];
}

RCT_EXPORT_METHOD(stop) {
    [self.locationManager stopUpdatingHeading];
}

RCT_EXPORT_MODULE()

@end
