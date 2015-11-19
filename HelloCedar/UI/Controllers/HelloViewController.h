#import <UIKit/UIKit.h>


@class TitleTextTransformer;

@interface HelloViewController : UIViewController

@property (nonatomic, weak, readonly) UILabel *titleLabel;

+ (instancetype)new UNAVAILABLE_ATTRIBUTE;
- (instancetype)init UNAVAILABLE_ATTRIBUTE;
- (id)initWithCoder:(NSCoder *)aDecoder UNAVAILABLE_ATTRIBUTE;
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil UNAVAILABLE_ATTRIBUTE;

- (instancetype)initWithTitleTextTransformer:(TitleTextTransformer *)titleTextTransformer NS_DESIGNATED_INITIALIZER;

@end
