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
    //_textAddresses.text = @"INTERFACES";
    
    Host *host = [Host new];
    NSDictionary *interfaces = [host getInterfaces];
    for (NSString *key in interfaces) {
        _textAddresses.text = [_textAddresses.text stringByAppendingFormat:@"%@:\n", key];
        NSArray *addresses = [interfaces objectForKey:key];
        for (NSString *address in addresses) {
            _textAddresses.text = [_textAddresses.text stringByAppendingFormat:@"\t%@\n", address];
        }
//        for (int i=0; i < [addresses count]; i++) {
//            NSLog(addresses objectAtIndex:<#(NSUInteger)#>)
//        }
    }
    
//    for (int i=0; i < [interfaces count]; i++) {
//        _textAddresses.text = [_textAddresses.text stringByAppendingFormat: @"%@\n", [addresses objectAtIndex:i]];
//    }
    
    
//    if (@available(iOS 12.0, *)) {
//        _pathMonitor = nw_path_monitor_create();
//        nw_endpoint_t endpoint = nw_endpoint_create_host("8.8.8.8", "80");
//    } else {
        // Fallback on earlier versions
//    }
    

}


@end
