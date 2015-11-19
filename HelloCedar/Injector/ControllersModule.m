#import <UIKit/UIKit.h>
#import "ControllersModule.h"
#import "BSBinder.h"
#import "BSInjector.h"
#import "HelloViewController.h"
#import "TitleTextTransformer.h"


@implementation ControllersModule

- (void)configure:(id<BSBinder> __nonnull)binder
{

    [binder bind:[HelloViewController class] toBlock:^id _Nonnull(NSArray * _Nonnull args, id<BSInjector>  _Nonnull injector) {
        return [[HelloViewController alloc] initWithTitleTextTransformer:[injector getInstance:[TitleTextTransformer class]]];
    }];
    
}


@end
