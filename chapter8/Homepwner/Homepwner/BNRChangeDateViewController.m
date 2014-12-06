//
//  BNRChangeDateViewController.m
//  Homepwner
//
//  Created by Dana Hall on 12/5/14.
//  Copyright (c) 2014 Dana Hall. All rights reserved.
//

#import "BNRChangeDateViewController.h"
#import "BNRItem.h"

@interface BNRChangeDateViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *changeDatePicker;

@end

@implementation BNRChangeDateViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    BNRItem *item = self.item;
    NSDate *date = item.dateCreated;
//    NSLog(@"%@", date);
    
    [self.changeDatePicker setDate:date animated:YES];    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // Clear first responder
    [self.view endEditing:YES];
    
    // "Save" changes to date
    NSDate *date = self.changeDatePicker.date;
    self.item.dateCreated = date;
//    NSLog(@"%@", self.item.dateCreated);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
