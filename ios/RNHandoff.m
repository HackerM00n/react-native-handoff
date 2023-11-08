#import "RNHandoff.h"

@implementation RNHandoff

RCT_EXPORT_MODULE()

// Keep a reference to the current user activity
NSUserActivity *currentActivity = nil;

RCT_EXPORT_METHOD(becomeCurrent:(NSNumber * _Nonnull)activityId type:(NSString *)type title:(NSString *)title url:(NSString *)url)
{
    // Invalidate the current activity if it exists
    if (currentActivity) {
        [currentActivity invalidate];
        currentActivity = nil;
    }

    // Create and become the new activity
    NSUserActivity* activity = [[NSUserActivity alloc] initWithActivityType:type];
    activity.title = title;
    activity.webpageURL = [[NSURL alloc] initWithString:url];
    
    [activity becomeCurrent];
    
    // Keep a reference to the new current activity
    currentActivity = activity;
}

RCT_EXPORT_METHOD(invalidate:(NSNumber * _Nonnull)activityId)
{
    // Invalidate the current activity if it exists
    if (currentActivity) {
        [currentActivity invalidate];
        currentActivity = nil;
    }
}

@end
