//
//  FindUserViewController.m
//  challenge
//
//  Created by Patrícia Gabriele Neri on 13/11/16.
//  Copyright © 2016 Patrícia Gabriele Neri. All rights reserved.
//

#import "FindUserViewController.h"
#import "ResponseUserList.h"
#import "AlertView.h"

@interface FindUserViewController ()

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation FindUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = [[NSMutableArray alloc] init];
    [self loadUserFromGitHub];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadUserFromGitHub {
    NSString *url = [NSString stringWithFormat:@"https://api.github.com/users/pgneri"];
    
    // buscar lista de usuarios
    [[[WebService alloc] init] getUserWithUrl:url withCompletion:^(NSDictionary *JSONResponse) {
        // parser para o JSON do response
        ResponseUserList *response = [[ResponseUserList alloc] initWithDictionary:JSONResponse];

        [self didReceiveResponse:response];
    } andError:^{
        [AlertView showAlertWithTitle:@"Error" andMessage:@"Error while retrieving information. Please, try again."];
    }];
}

- (void)didReceiveResponse:(ResponseUserList *)response {

    NSLog(@"%@", response);
    NSLog(@"aaaaaaaa");
    NSLog(@"%@",response.aUsers);
    [_dataSource addObjectsFromArray:response.aUsers];
    
    //[_tableView reloadData];

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
