//
//  Repository.h
//  challenge
//
//  Created by Patrícia Gabriele Neri on 13/11/16.
//  Copyright © 2016 Patrícia Gabriele Neri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Repository : NSObject

@property (nonatomic, strong) NSString *name;

/*!
 * init method for repository
 */
- (Repository *)initWithDictionary:(NSDictionary *)dic;

@end