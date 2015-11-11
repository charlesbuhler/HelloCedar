#import "Cedar.h"
#import "HelloViewController.h"
#import "BSInjector.h"
#import "BSBinder.h"
#import "InjectorProvider.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(HelloViewControllerSpec)

describe(@"HelloViewController", ^{
    __block HelloViewController *subject;

    beforeEach(^{
        id<BSBinder, BSInjector> injector = [InjectorProvider injector];
        
        subject = [injector getInstance:[HelloViewController class]];
    });
    
    it(@"should correctly set the title text and background color", ^{
        [subject loadViewIfNeeded];
        
        subject.titleLabel.text should equal(@"Hello, Cedar!");
        subject.view.backgroundColor should equal([UIColor yellowColor]);
    });
});

SPEC_END
