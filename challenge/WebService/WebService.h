//
//  WebService.h
//  challenge
//
//  Created by Patrícia Gabriele Neri on 13/11/16.
//  Copyright © 2016 Patrícia Gabriele Neri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebService : NSObject
@property (nonatomic,copy) NSDictionary* dic;

/*!
 * Method to simple get User
 */
- (void)getUserWithUrl:(NSString *)url withCompletion:(void (^)(NSDictionary *JSONResponse))success andError:(void (^)(void))err;
/*!
 * Method to simple get Repository
 */
- (void)getRepositoryWithUrl:(NSString *)url withCompletion:(void (^)(NSDictionary *JSONResponse))success andError:(void (^)(void))err;

@end
