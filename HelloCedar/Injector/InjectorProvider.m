#import "InjectorProvider.h"
#import "Blindside.h"
#import "ControllersModule.h"
#import "RouterModule.h"
#import "TransformersModule.h"


@implementation InjectorProvider

+ (id<BSBinder, BSInjector>)injector
{
    id<BSModule> controllersModule = [[ControllersModule alloc] init];
    id<BSModule> transformersModule = [[TransformersModule alloc] init];
    id<BSModule> routerModule = [[RouterModule alloc] init];

    return (id<BSBinder, BSInjector>)[Blindside injectorWithModules:@[controllersModule,
                                                                      transformersModule,
                                                                      routerModule]];
}

@end
