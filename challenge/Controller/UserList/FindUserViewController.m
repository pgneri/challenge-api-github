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
#import "UserTableViewCell.h"

@interface FindUserViewController ()

@property (nonatomic, strong) NSMutableArray *dataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchUser;

@end

@implementation FindUserViewController

- (void)viewDidLoad {
    currentPage = 1;
    self.dataSource = [[NSMutableArray alloc] init];

     UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];

    [self.view addGestureRecognizer:tap];
//    [self loadUsersFromGitHub:_searchUser.text];
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadUsersFromGitHub:(NSString *)name {
    if(name!=nil && ![name isEqual:@""]){
        NSString *url = [NSString stringWithFormat:@"https://api.github.com/search/users?q=%@&page=%d",name,currentPage];
        
        // buscar lista de usuarios
        [[[WebService alloc] init] getGitHubInformationWithUrl:url withCompletion:^(NSDictionary *JSONResponse) {
            // parser para o JSON do response
            ResponseUserList *response = [[ResponseUserList alloc] initWithDictionary:JSONResponse];
            
            currentPage ++;
            [self didReceiveResponse:response];
        } andError:^{
            [AlertView showAlertWithTitle:@"Error" andMessage:@"Error while retrieving information. Please, try again."];
        }];
    }
}

- (void)didReceiveResponse:(ResponseUserList *)response {
    [_dataSource addObjectsFromArray:response.aUsers];
    [_tableView reloadData];
}


#pragma mark - UITableView Delegate && DataSource

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if (indexPath.row == _dataSource.count -1 && _dataSource.count>=30) {
        currentPage += 1;
        [self loadUsersFromGitHub:_searchUser.text];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UserTableViewCell *cell = (UserTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"UserTableViewCell" owner:self options:nil];
        cell = [topLevelObjects objectAtIndex:0];
    }
    
    [cell setupWitUser:[_dataSource objectAtIndex:indexPath.row]];
    
    return cell;
}

#pragma mark - UISearchView Delegate and DataSource

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    @try {
       currentPage = 1;
       [self loadUsersFromGitHub:searchBar.text];
        self.dataSource = [[NSMutableArray alloc] init];
       [_tableView reloadData];
    }
    @catch (NSException *exception) {
        NSLog(@"%@",exception);
        [AlertView showAlertWithTitle:@"Error" andMessage:@"Error while retrieving information. Please, try again."];
    }
    @finally {

    }
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self dismissKeyboard];
    searchBar.text = nil;
    [self.navigationItem setRightBarButtonItem:nil animated:YES];
}


- (void) dismissKeyboard
{
    [self.searchUser resignFirstResponder];
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
