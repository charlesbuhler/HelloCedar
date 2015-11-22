#import <UIKit/UIKit.h>


@protocol BSInjector;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic) id<BSInjector> injector;
@property (strong, nonatomic) UIWindow *window;


@end
