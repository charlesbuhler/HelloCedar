#import "Cedar.h"
#import "HelloController.h"
#import "BSInjector.h"
#import "BSBinder.h"
#import "InjectorProvider.h"
#import "TitleTextTransformer.h"


using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(HelloControllerSpec)

describe(@"HelloController", ^{
    __block HelloController *subject;
    __block TitleTextTransformer *titleTextTransformer;

    beforeEach(^{
        id<BSBinder, BSInjector> injector = [InjectorProvider injector];

        titleTextTransformer = nice_fake_for([TitleTextTransformer class]);
        [injector bind:[TitleTextTransformer class] toInstance:titleTextTransformer];

        NSAttributedString *expectedTitle = [[NSAttributedString alloc] initWithString:@"my_expected_title"];
        titleTextTransformer stub_method(@selector(transformedValue:))
            .with(@"Hello, Cedar!")
            .and_return(expectedTitle);


        subject = [injector getInstance:[HelloController class]];
        [subject loadViewIfNeeded];
    });

    it(@"should correctly set the background color", ^{
        subject.view.backgroundColor should equal([UIColor yellowColor]);
    });

    it(@"should correctly set the title text", ^{
        subject.titleLabel.textColor should equal([UIColor redColor]);
        subject.titleLabel.text should equal(@"my_expected_title");
    });

});

SPEC_END
