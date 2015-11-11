#import "HelloViewController.h"


@interface HelloViewController ()

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;

@end

@implementation HelloViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor yellowColor]];
    
    [self.titleLabel setTextColor:[UIColor redColor]];
    [self.titleLabel setText:@"Hello, Cedar!"];
}

@end
