//
//  FindRepositoryViewController.m
//  challenge
//
//  Created by Patrícia Gabriele Neri on 13/11/16.
//  Copyright © 2016 Patrícia Gabriele Neri. All rights reserved.
//

#import "FindRepositoryViewController.h"
#import "ResponseRepositoryList.h"
#import "AlertView.h"
#import "RepositoryTableViewCell.h"

@interface FindRepositoryViewController ()

@property (nonatomic, strong) NSMutableArray *dataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchRepository;

@end


@implementation FindRepositoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = [[NSMutableArray alloc] init];
    
     UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];

    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadRepositoriesFromGitHub:(NSString *)name {

    NSString *url = [NSString stringWithFormat:@"https://api.github.com/search/repositories?q=%@",name];
    // buscar lista de repositorios
    [[[WebService alloc] init] getGitHubInformationWithUrl:url withCompletion:^(NSDictionary *JSONResponse) {
        // parser para o JSON do response
        ResponseRepositoryList *response = [[ResponseRepositoryList alloc] initWithDictionary:JSONResponse];

        [self didReceiveResponse:response];
    } andError:^{
        [AlertView showAlertWithTitle:@"Error" andMessage:@"Error while retrieving information. Please, try again."];
    }];
}

- (void)didReceiveResponse:(ResponseRepositoryList *)response {
    [_dataSource addObjectsFromArray:response.aRepositories];
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
        [self loadRepositoriesFromGitHub:_searchRepository.text];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 88.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RepositoryTableViewCell *cell = (RepositoryTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"RepositoryTableViewCell" owner:self options:nil];
        cell = [topLevelObjects objectAtIndex:0];
    }
    
    [cell setupWitRepository:[_dataSource objectAtIndex:indexPath.row]];
    
    return cell;
}

#pragma mark - UISearchView Delegate and DataSource

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    @try {
        currentPage = 1;
       [self loadRepositoriesFromGitHub:searchBar.text];
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
    [self.searchRepository resignFirstResponder];
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
