//
//  WebService.m
//  challenge
//
//  Created by Patrícia Gabriele Neri on 13/11/16.
//  Copyright © 2016 Patrícia Gabriele Neri. All rights reserved.
//

#import "WebService.h"
#import "challenge-Bridging-Header.h"

@implementation WebService

- (NSMutableURLRequest *)requestWithUrl:(NSString *)url {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:url]];
    [request setValue:@"application/json;charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    return request;
}

- (void)getUserWithUrl:(NSString *)url withCompletion:(void (^)(NSDictionary *JSONResponse))success andError:(void (^)(void))err {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        NSError *error = nil;
        
//        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
//
//        if(dic!=nil) {
//            if (!error) {
//                NSLog(@"JSON: %@", responseObject);
//                NSLog(@"Chamada efetuada com sucesso");
//                success(dic);
//            } else {
//                err();
//            }
//        } else {
//            NSLog(@"Error: %@", error);
//            err();
//        }

        success(responseObject);



    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        err();
    }];
}

- (void)getRepositoryWithUrl:(NSString *)url withCompletion:(void (^)(NSDictionary *JSONResponse))success andError:(void (^)(void))err {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

@end
