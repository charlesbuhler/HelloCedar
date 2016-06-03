#import "Blindside.h"
#import "Cedar.h"
#import "AppDelegate.h"
#import "InjectorProvider.h"
#import "Router.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(AppDelegateSpec)

describe(@"AppDelegate", ^{
    __block AppDelegate *subject;
    __block id<BSBinder, BSInjector> injector;
    __block UIApplication *application;
    __block Router *router;

    beforeEach(^{
        subject = [[AppDelegate alloc] init];
        injector = [InjectorProvider injector];
        
        router = nice_fake_for([Router class]);
        [injector bind:[Router class] toInstance:router];

        application = fake_for([UIApplication class]);
        
        subject.injector = injector;
    });
    
    describe(@"-application:didFinishLaunchingWithOptions:", ^{
        __block UIViewController *expectedRootViewController;
        
        beforeEach(^{
            expectedRootViewController = nice_fake_for([UIViewController class]);
            router stub_method(@selector(rootViewController))
                .and_return(expectedRootViewController);
            
            [subject application:application willFinishLaunchingWithOptions:(id)[NSNull null]];
            [subject application:application didFinishLaunchingWithOptions:nil];
        });

        it(@"should set up the UI window", ^{
            subject.window should be_instance_of([UIWindow class]);
            subject.window.rootViewController should be_same_instance_as(expectedRootViewController);
        });
    });
});

SPEC_END
