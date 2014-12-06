//
//  BNRDetailViewController.m
//  Homepwner
//
//  Created by Dana Hall on 12/1/14.
//  Copyright (c) 2014 Dana Hall. All rights reserved.
//

#import "BNRDetailViewController.h"
#import "BNRChangeDateViewController.h"
#import "BNRItem.h"

@interface BNRDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialNumberField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIButton *dateButton;

@end

@implementation BNRDetailViewController

- (IBAction)changeDateClickHandler:(id)sender {

    BNRChangeDateViewController *changeDateViewController = [[BNRChangeDateViewController alloc] init];
    
//    NSLog(@"%@", _dateLabel.text);
    
    // Set view item pointer to self item
    changeDateViewController.item = self.item;
    
    // Push it onto the top of the navigation controller's stack
    [self.navigationController pushViewController:changeDateViewController animated:YES];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    BNRItem *item = self.item;
    
    self.nameField.text = item.itemName;
    self.serialNumberField.text = item.serialNumber;
    self.valueField.text = [NSString stringWithFormat:@"$%d", item.valueInDollars];
    
    // You need an NSDateFormatter that will turn a date into a simple date string
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
    }
    
    // Use filtered NSDate object to set dateLabel contents
    self.dateLabel.text = [dateFormatter stringFromDate:item.dateCreated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // Clear first responder
    [self.view endEditing:YES];
    
    // "Save" changes to item
    BNRItem *item = self.item;
    item.itemName = self.nameField.text;
    item.serialNumber = self.serialNumberField.text;
    
//    item.valueInDollars = [self.valueField.text intValue];
    NSString *valueInDollarsString = [self.valueField.text substringWithRange:NSMakeRange(1,self.valueField.text.length-1)];
    item.valueInDollars = [valueInDollarsString intValue];    
}

- (void)setItem:(BNRItem *)item
{
    _item = item;
    self.navigationItem.title = _item.itemName;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_valueField resignFirstResponder];
}

@end
