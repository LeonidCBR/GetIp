//
//  Host.m
//  GetIP
//
//  Created by Яна Латышева on 15.12.2020.
//

#import <Foundation/Foundation.h>
#import <ifaddrs.h>
#import <arpa/inet.h>
#import "Host.h"


@implementation Host

// Get the INTERNAL ip address
- (NSDictionary * _Nullable)getInterfaces {
    
    NSMutableDictionary *interfaces = [NSMutableDictionary dictionary];
    //NSMutableArray *arrAddresses = [NSMutableArray array];
    
    NSString *address = @"error";
    char addr[INET6_ADDRSTRLEN];
    struct ifaddrs *addresses = NULL;
    struct ifaddrs *currentAddr = NULL;

    // retrieve the current interfaces
    // returns 0 on success
    if (getifaddrs(&addresses) == -1) {
        NSLog(@"DEBUG: ERROR getifaddrs");
        return NULL;
    }
    
    // Loop through linked list of interfaces
    currentAddr = addresses;
    while (currentAddr) {
        
//        NSLog(@"Family: %d", currentAddr->ifa_addr->sa_family);
        
        if ((currentAddr->ifa_addr) &&
            (currentAddr->ifa_addr->sa_family == AF_INET || currentAddr->ifa_addr->sa_family == AF_INET6))
        {
//            NSLog(@"Interface: %s", currentAddr->ifa_name);
            
            NSString *interfaceName = [NSString stringWithUTF8String:currentAddr->ifa_name];
            if (! [interfaces objectForKey:interfaceName]) {
                // add new interface
                [interfaces setObject:[NSMutableArray array] forKey:interfaceName];
            }
            
            
            
            if (currentAddr->ifa_addr->sa_family == AF_INET) {
                
                /*
                 // Interface "en0" is the wifi connection on the iPhone
                 if ([[NSString stringWithUTF8String:currentAddr->ifa_name] isEqualToString:@"en0"]) {
                 // got wifi
                 }
                 */
                struct sockaddr_in *ifAddress = (struct sockaddr_in *)currentAddr->ifa_addr;
                address = [NSString stringWithUTF8String:inet_ntoa(ifAddress->sin_addr)];
                //address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)currentAddr->ifa_addr)->sin_addr)];
//                NSLog(@"Ip: %@", address);
   
            } else {
                
                // AF_INET6
                struct sockaddr_in6 *ifAddress6 = (struct sockaddr_in6 *)currentAddr->ifa_addr;
                inet_ntop(AF_INET6, &ifAddress6->sin6_addr, addr, sizeof(addr));
                address = [NSString stringWithUTF8String:addr];
//                NSLog(@"Ip: %@", address);
                
           
            }
            
            NSMutableArray *currentAddresses = [interfaces objectForKey:interfaceName];
            [currentAddresses addObject:address];
//            [arrAddresses addObject:address];

        }
        
        currentAddr = currentAddr->ifa_next;
    }
    
    
    // Free memory
    freeifaddrs(addresses);
    
    //NSArray *resultAddresses = [arrAddresses copy];
    //return resultAddresses;
//    NSDictionary *result = [interfaces copy];
//    return result;
    _interfaces = [interfaces copy];
    
//    NSMutableArray *listOfNames = [NSMutableArray array];
//    for (NSString *name in _interfaces.allKeys)
    _names = _interfaces.allKeys;
    
    return _interfaces;
}


@end
