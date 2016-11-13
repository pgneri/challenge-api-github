//
//  WebService.h
//  challenge
//
//  Created by Patrícia Gabriele Neri on 13/11/16.
//  Copyright © 2016 Patrícia Gabriele Neri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebService : NSObject

- (void)getUserWithUrl:(NSString *)url withCompletion:(void (^)(NSDictionary *JSONResponse))success andError:(void (^)(void))err;
- (void)getRepositoryWithUrl:(NSString *)url withCompletion:(void (^)(NSDictionary *JSONResponse))success andError:(void (^)(void))err;

@end
