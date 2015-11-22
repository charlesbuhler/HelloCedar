#import "Router.h"
#import "BSInjector.h"
#import "HelloController.h"


@interface Router ()

@property (nonatomic) UIViewController *rootViewController__;
@property (nonatomic, weak) id<BSInjector> injector;

@end

@implementation Router

- (UIViewController *)rootViewController
{
    if (self.rootViewController__) {
        return self.rootViewController__;
    }

    self.rootViewController__ = [self.injector getInstance:[HelloController class]];;

    return self.rootViewController__;
}

@end
