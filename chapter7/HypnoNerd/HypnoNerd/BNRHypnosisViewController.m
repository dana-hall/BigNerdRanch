//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Dana Hall on 10/3/14.
//  Copyright (c) 2014 Dana Hall. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@interface BNRHypnosisViewController () <UITextFieldDelegate>

@end

@implementation BNRHypnosisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"BNRHypnosisViewController loaded it's view");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView
{
    // Create a view
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] init];
    
    CGRect textFieldRect = CGRectMake(40, 40, 240, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];
    
    // Setting the border style on the text field will allow us to see it more easily
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Hypnotize me";
    textField.returnKeyType = UIReturnKeyDone;
//    [textField becomeFirstResponder];
    textField.delegate = self;
    
    [backgroundView addSubview:textField];
    
    // Set it as the view of this view controller
    self.view = backgroundView;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        // Set the tab bar item's title
        self.tabBarItem.title = @"Hypnotize";
        
        // Create a UIImage from a file
        UIImage *i = [UIImage imageNamed:@"user_16.png"];
        
        // Put that image on the tab bar item
        self.tabBarItem.image = i;
    }
    
    return self;  
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
//    NSLog(@"%@", textField.text);
    [self drawHypnoticMessage:textField.text];
    
    textField.text = @"";
    [textField resignFirstResponder];
    
    return YES;
}

// Dana - this work too.  I had to add a rect to the textfield to get it to draw
//- (void)drawHypnoticMessage:(NSString *)message
//{
//    for (int i = 0; i < 20; i++) {
//        UILabel *messageLabelTemp = [[UILabel alloc] init];
//    
//        // Configure the label's colors and text
//        messageLabelTemp.text = message;
//    
//        // This method resizes the label, which will be relative to the text that it is displaying
//        [messageLabelTemp sizeToFit];
//    
//        // Get a random x value that fits within the hypnosis view's width
//        int width = (int)(self.view.bounds.size.width - messageLabelTemp.bounds.size.width);
//        int x = arc4random() % width;
//    
//        // Get a random y value that fits within the hypnosis view's height
//        int height = (int)(self.view.bounds.size.height - messageLabelTemp.bounds.size.height);
//        int y = arc4random() % height;
//    
//        CGRect messageLabelRect = CGRectMake(x, y, width, height);
//        UILabel *messageLabel = [[UILabel alloc] initWithFrame:messageLabelRect];
//        messageLabel.backgroundColor = [UIColor clearColor];
//        messageLabel.text = message;
//        [messageLabel sizeToFit];
//    
//        // Add the label to the hierarchy
//        [self.view addSubview:messageLabel];
//    }
//}
- (void)drawHypnoticMessage:(NSString *)message
{
    for (int i = 0; i < 20; i++) {
        UILabel *messageLabel = [[UILabel alloc] init];
    
        // Configure the label's colors and text
        messageLabel.backgroundColor = [UIColor clearColor];
        
        //Random colors for the text display
//        messageLabel.textColor = [UIColor redColor];
        float red = (arc4random() % 100) / 100.0;
        float green = (arc4random() % 100) / 100.0;
        float blue = (arc4random() % 100) / 100.0;
        
        UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
        messageLabel.textColor = randomColor;

        messageLabel.text = message;
    
        // This method resizes the label, which will be relative to the text that it is displaying
        [messageLabel sizeToFit];
    
        // Get a random x value that fits within the hypnosis view's width
        int width = (int)(self.view.bounds.size.width - messageLabel.bounds.size.width);
        int x = arc4random() % width;
    
        // Get a random y value that fits within the hypnosis view's height
        int height = (int)(self.view.bounds.size.height - messageLabel.bounds.size.height);
        int y = arc4random() % height;
    
        // Update the label's frame
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
    
        messageLabel.frame = frame;
    
        // Add the label to the hierarchy
        [self.view addSubview:messageLabel];
        
        // Add motion effects
        UIInterpolatingMotionEffect *motionEffect;
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:motionEffect];
        
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        motionEffect.minimumRelativeValue = @(-25);
        motionEffect.maximumRelativeValue = @(25);
        [messageLabel addMotionEffect:motionEffect];
    }
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
