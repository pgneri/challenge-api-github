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

- (void)getGitHubInformationWithUrl:(NSString *)url withCompletion:(void (^)(NSDictionary *JSONResponse))success andError:(void (^)(void))err {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        NSError *error = nil;
        if (!error) {
            NSLog(@"Chamada efetuada com sucesso");
            NSLog(@"%@",responseObject);
            success(responseObject);
        } else {
            err();
        }

    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        err();
    }];
}

@end
