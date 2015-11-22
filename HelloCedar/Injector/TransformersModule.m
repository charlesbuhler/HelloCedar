#import <UIKit/UIKit.h>
#import "TransformersModule.h"
#import "BSBinder.h"
#import "BSInjector.h"
#import "TitleTextTransformer.h"


@implementation TransformersModule

- (void)configure:(id<BSBinder> __nonnull)binder
{

    [binder bind:[TitleTextTransformer class] toBlock:^id _Nonnull(NSArray * _Nonnull args, id<BSInjector>  _Nonnull injector) {
        return [[TitleTextTransformer alloc] init];
    }];

}

@end
