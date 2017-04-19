//
//  ViewController.m
//  OPayDemo
//
//  Created by NixonShih on 2017/4/17.
//  Copyright © 2017年 歐付寶. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "OPay.h"

@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray<NSDictionary*> *dataSource;
@end

static NSString *kTitleTag = @"Title";
static NSString *kValueTag = @"Value";

@implementation ViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
    NSString *redirectURL = [NSString stringWithFormat:@"OPayDemo://%@",bundleIdentifier];
    _dataSource = @[
                    @{kTitleTag:@"MerchantID",kValueTag:kMerchantID},
                    @{kTitleTag:@"TradeToken",kValueTag:@"ACCB8B6B8B0D4884A813F92A8FD73DB2"},
                    @{kTitleTag:@"RedirectURL",kValueTag:redirectURL}
                    ];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didBecomeActiveWithNotification:) name:UIApplicationDidBecomeActiveNotification object:nil];
}

#pragma mark - Event

- (IBAction)submitBtnPressed:(id)sender {
    
    OPayTradeCaller *tradeCaller = [OPayTradeCaller new];
    BOOL success = [tradeCaller checkoutWithTradeToken:_dataSource[1][kValueTag]
                                           redirectURL:_dataSource[2][kValueTag]];
    
    if (!success) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"Fail" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:alert animated:true completion:nil];
    }
}

- (void)didBecomeActiveWithNotification:(NSNotificationCenter*)notification {
    
    OPayApp *opay = [OPayApp shared];
    OPTradeResponse *response = opay.tradeResponse;

    if (response) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:response.rtnCode message:response.rtnMsg preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:alert animated:true completion:nil];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSDictionary *dic = _dataSource[indexPath.row];
    cell.textLabel.text = dic[kTitleTag];
    cell.detailTextLabel.text = dic[kValueTag];
    return cell;
}

@end
