//
//  Repository.m
//  challenge
//
//  Created by Patrícia Gabriele Neri on 13/11/16.
//  Copyright © 2016 Patrícia Gabriele Neri. All rights reserved.
//

#import "Repository.h"

@implementation Repository

- (Repository *)initWithDictionary:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        _name = dic[@"name"];
    }
    return self;
}


@end
