//
//  ViewController.m
//  GetIP
//
//  Created by Яна Латышева on 15.12.2020.
//

#import "ViewController.h"
#import "Host.h"
//#import <Network/path.h>
//#import <Network/endpoint.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textAddresses;
//@property (strong, nonatomic) nw_path_monitor_t pathMonitor;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // TODO: - add tableviewcontroller, where sections have names of interfaces and rows are ipaddresses
    
    Host *host = [Host new];
    NSArray *addresses = [host getIpAddress];
    
    _textAddresses.text = @"IP:\n";

    for (int i=0; i < [addresses count]; i++) {
        _textAddresses.text = [_textAddresses.text stringByAppendingFormat: @"%@\n", [addresses objectAtIndex:i]];
    }
    
    if (@available(iOS 12.0, *)) {
        
//        _pathMonitor = nw_path_monitor_create();
//        nw_endpoint_t endpoint = nw_endpoint_create_host("8.8.8.8", "80");
        
    } else {
        // Fallback on earlier versions
    }
    

}


@end
