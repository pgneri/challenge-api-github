//
//  ResponseRepositoryList.m
//  challenge
//
//  Created by Patrícia Gabriele Neri on 13/11/16.
//  Copyright © 2016 Patrícia Gabriele Neri. All rights reserved.
//

#import "ResponseRepositoryList.h"
#import "Repository.h"

@implementation ResponseRepositoryList

- (ResponseRepositoryList *)initWithDictionary:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        _aRepositories = [[NSMutableArray alloc] init];
        
        NSDictionary *results = dic[@"items"];
        for (NSDictionary *dic in results) {
            [_aRepositories addObject:[[Repository alloc] initWithDictionary:dic]];
        }
    }
    return self;
}


@end
