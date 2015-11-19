#import "HelloViewController.h"
#import "TitleTextTransformer.h"


@interface HelloViewController ()

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;

@property (nonatomic) TitleTextTransformer *titleTextTransformer;

@end

@implementation HelloViewController

- (instancetype)initWithTitleTextTransformer:(TitleTextTransformer *)titleTextTransformer
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.titleTextTransformer = titleTextTransformer;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor yellowColor]];
    
    NSAttributedString *titleText = [self.titleTextTransformer transformedValue:@"Hello, Cedar!"];
    
    [self.titleLabel setTextColor:[UIColor redColor]];
    self.titleLabel.attributedText = titleText;
}

#pragma mark - NSObject

- (instancetype)init
{
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

@end
