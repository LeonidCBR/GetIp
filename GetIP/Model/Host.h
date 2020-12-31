//
//  Host.h
//  GetIP
//
//  Created by Яна Латышева on 15.12.2020.
//

#ifndef Host_h
#define Host_h

@interface Host : NSObject

@property (strong, nonatomic) NSDictionary * _Nullable interfaces;
@property (strong, nonatomic) NSArray * _Nullable names;

- (NSDictionary * _Nullable)getInterfaces;

@end

#endif /* Host_h */
