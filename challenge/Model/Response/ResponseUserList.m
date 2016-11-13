//
//  ResponseUserList.m
//  challenge
//
//  Created by Patrícia Gabriele Neri on 13/11/16.
//  Copyright © 2016 Patrícia Gabriele Neri. All rights reserved.
//

#import "ResponseUserList.h"
#import "User.h"
#import "AlertView.h"
#import "FindUserViewController.h"

@implementation ResponseUserList

- (ResponseUserList *)initWithDictionary:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        _aUsers = [[NSMutableArray alloc] init];
        
        NSDictionary *results = dic[@"items"];
        if(results.count>0){
            for (NSDictionary *dic in results) {
                [_aUsers addObject:[[User alloc] initWithDictionary:dic]];
            }
        } else {
            [AlertView showAlertWithMessage:@"No information found."];
            [_aUsers addObject:[[User alloc] initWithDictionary:nil]];
        }
    }
    return self;
}


@end
