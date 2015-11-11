#import "RouterModule.h"
#import "BSBinder.h"
#import "BSInjector.h"
#import "Router.h"


@implementation RouterModule

#pragma mark - <BSModule>

- (void)configure:(id<BSBinder> __nonnull)binder
{
    [binder bind:[Router class] toBlock:^(NSArray *args, id<BSInjector> injector){
        return [[Router alloc] init];
    }];
}

@end
