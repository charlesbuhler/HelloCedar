#import <UIKit/UIKit.h>
#import "ControllersModule.h"
#import "BSBinder.h"
#import "BSInjector.h"
#import "HelloController.h"
#import "TitleTextTransformer.h"


@implementation ControllersModule

- (void)configure:(id<BSBinder> __nonnull)binder
{

    [binder bind:[HelloController class] toBlock:^id _Nonnull(NSArray * _Nonnull args, id<BSInjector>  _Nonnull injector) {
        return [[HelloController alloc] initWithTitleTextTransformer:[injector getInstance:[TitleTextTransformer class]]];
    }];

}

@end
