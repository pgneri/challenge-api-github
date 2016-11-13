//
//  ResponseUserList.h
//  challenge
//
//  Created by Patrícia Gabriele Neri on 13/11/16.
//  Copyright © 2016 Patrícia Gabriele Neri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResponseUserList : NSObject
@property (nonatomic, strong) NSMutableArray *aUsers;

/*!
 * Method to user list response 
 */
- (ResponseUserList *)initWithDictionary:(NSDictionary *)dic;

@end
