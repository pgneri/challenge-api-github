//
//  ResponseUserList.m
//  challenge
//
//  Created by Patrícia Gabriele Neri on 13/11/16.
//  Copyright © 2016 Patrícia Gabriele Neri. All rights reserved.
//

#import "ResponseUserList.h"
#import "User.h"

@implementation ResponseUserList

- (ResponseUserList *)initWithDictionary:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        _aUsers = [[NSMutableArray alloc] init];
        
        NSDictionary *results = dic[@"data"];
        for (NSDictionary *dic in results[@"results"]) {
        NSLog(@"EEEEE");
            [_aUsers addObject:[[User alloc] initWithDictionary:dic]];
        }
    }
    return self;
}


@end
