//
//  ViewController.m
//  GetIP
//
//  Created by Яна Латышева on 15.12.2020.
//

#import "ViewController.h"
#import "Host.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textAddresses;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Host *host = [Host new];
    NSArray *addresses = [host getIpAddress];
    
    _textAddresses.text = @"IP:\n";

    for (int i=0; i < [addresses count]; i++) {
        _textAddresses.text = [_textAddresses.text stringByAppendingFormat: @"%@\n", [addresses objectAtIndex:i]];
    }

}


@end
