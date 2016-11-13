//
//  ResponseRepositoryList.h
//  challenge
//
//  Created by Patrícia Gabriele Neri on 13/11/16.
//  Copyright © 2016 Patrícia Gabriele Neri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResponseRepositoryList : NSObject

@property (nonatomic, strong) NSMutableArray *aRepositories;

/*!
 * Method to repository list response 
 */
- (ResponseRepositoryList *)initWithDictionary:(NSDictionary *)dic;


@end
