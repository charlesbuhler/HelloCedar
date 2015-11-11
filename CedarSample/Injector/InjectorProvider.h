#import <Foundation/Foundation.h>


@protocol BSBinder;
@protocol BSInjector;


@interface InjectorProvider : NSObject

+ (id<BSBinder, BSInjector>)injector;

@end
