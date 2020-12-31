//
//  HomeController.m
//  GetIP
//
//  Created by Яна Латышева on 28.12.2020.
//

#import "HomeController.h"
#import "Host.h"

@interface HomeController ()

@property (strong, nonatomic) NSDictionary *interfaces;
@property (strong, nonatomic) NSArray *names;

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Interfaces";
    if (@available(iOS 11.0, *)) {
        self.navigationController.navigationBar.prefersLargeTitles = YES;
    }
    
    // TODO: - refactor
    [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"interfaceCellIdentifier"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    Host *host = [Host new];
    _interfaces = [host getInterfaces];
    _names = host.names;
//    NSLog(@"%@", _interfaces);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (_interfaces) {
        return _interfaces.count;
    } else {
        return 0;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[_interfaces objectForKey:[_names objectAtIndex:section]] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"interfaceCellIdentifier" forIndexPath:indexPath];
    
//    NSInteger section = indexPath.section;
//    NSInteger row = indexPath.row;
    NSString *key = [_names objectAtIndex:indexPath.section];
    
    cell.textLabel.text = [[_interfaces objectForKey:key] objectAtIndex:indexPath.row];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [_names objectAtIndex:section];
}

@end
