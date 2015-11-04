#import "Cedar.h"

using namespace Cedar::Matchers;

SPEC_BEGIN(Example)

it(@"should add two numbers", ^{
    1 + 2 should equal(3);
});

SPEC_END
