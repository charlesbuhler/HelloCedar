#import "TitleTextTransformer.h"
#import <UIKit/UIKit.h>


@implementation TitleTextTransformer

#pragma mark - NSValueTransformer

- (NSAttributedString *)transformedValue:(NSString *)string
{
    NSMutableAttributedString *transformedString = [[NSMutableAttributedString alloc] initWithString:string];
    [transformedString addAttribute:NSKernAttributeName
                              value:@(2.0f)
                              range:NSMakeRange(0, [string length])];
    return transformedString;
}

@end
