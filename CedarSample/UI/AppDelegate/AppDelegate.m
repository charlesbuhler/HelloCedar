#import "AppDelegate.h"
#import "InjectorProvider.h"
#import "BSInjector.h"
#import "Router.h"


@interface AppDelegate ()

@property (nonatomic) Router *router;

@end

@implementation AppDelegate

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.injector = [InjectorProvider injector];
    }
    return self;
}

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.router = [self.injector getInstance:[Router class]];

    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    CGRect mainScreenBounds = [[UIScreen mainScreen] bounds];
    self.window = [[UIWindow alloc] initWithFrame:mainScreenBounds];
    
    UIViewController *rootViewController = [self.router rootViewController];
    self.window.rootViewController = rootViewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
