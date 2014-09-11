//
//  BNRQuizViewController.m
//  Quiz
//
//  Created by Dana Hall on 8/22/14.
//  Copyright (c) 2014 Dana Hall. All rights reserved.
//

#import "BNRQuizViewController.h"

@interface BNRQuizViewController ()

@property (nonatomic) int currentQuestionIndex;
@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@property (nonatomic, weak) IBOutlet UIButton *questionButton;
@property (nonatomic, weak) IBOutlet UIButton *answerButton;

@end

@implementation BNRQuizViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    // Call the init method implemented by the superclass
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // Create two arrays filled with questions and answers and make pointers to them
        self.questions = @[@"From what is cognac made",
                           @"What is 7+7?",
                           @"What is the capital of Colorado?",
                           @"Where are you?",
                           @"How much does a head weigh?"];
        
        self.answers = @[@"Grapes",
                         @"14",
                         @"Denver",
                         @"Right there",
                         @"10 to 11 pouunds"];

    }
 
    // Resturn the address of the new object
    return self;
}

- (IBAction)showQuestion:(id)sender
{
    // Step to the next question
    self.currentQuestionIndex++;
    
    self.answerButton.enabled = true;
    
    // Am I past the last question?
    if (self.currentQuestionIndex == self.questions.count) {
        // Go back to the first question
        self.currentQuestionIndex = 0;
    }
    
    // Get the string at the index in the question array.  Display the string in the question label
    self.questionLabel.text = self.questions[self.currentQuestionIndex];
    
    // Reset the answer label
    self.answerLabel.text = @"???";
}

- (IBAction)showAnswer:(id)sender
{
    if(self.questionLabel.text.length == 0) {
        self.answerButton.enabled = false;
    }
    else {
        // What is the answer to the current question?  Display it in the answer label
        self.answerLabel.text = self.answers[self.currentQuestionIndex];
    }
}

@end
