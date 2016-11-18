
#import "RNSimpleCompass.h"
#import "RCTLog.h"

@implementation RNSimpleCompass

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_METHOD(func)
{
    RCTLogInfo(@"Trying native log");
}
RCT_EXPORT_MODULE()

@end
