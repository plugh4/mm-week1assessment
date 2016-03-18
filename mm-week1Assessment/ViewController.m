//
//  ViewController.m
//  mm-week1Assessment
//
//  Created by Christopher Serra on 3/18/16.
//  Copyright © 2016 plugh. All rights reserved.
//

#import "ViewController.h"
#import "webViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIView *masterView;

@property (weak, nonatomic) IBOutlet UINavigationItem *navitem;
@property (weak, nonatomic) IBOutlet UIButton *webButton;

@property (weak, nonatomic) IBOutlet UITextField *value1Text;
@property (weak, nonatomic) IBOutlet UITextField *value2Text;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
    
    self.webButton.enabled = NO;
    self.title = @"Answer";
    self.value1Text.text = nil;
    self.value2Text.text = nil;
    self.masterView.backgroundColor = [UIColor whiteColor];
}


#pragma mark -
#pragma mark - Buttons


- (IBAction)onCalculateButtonPressed:(UIButton *)sender {
    // get operands
    int val1 = self.value1Text.text.intValue;
    int val2 = self.value2Text.text.intValue;

    // calculate result
    int result = val1 * val2;

    // display result
    NSString *resultAsStr = [NSString stringWithFormat:@"%i", result];
    self.title = resultAsStr;
    
    // hide keyboards
    [self.value1Text resignFirstResponder];
    [self.value2Text resignFirstResponder];
    
    // if multiple of 3, enable Web button
    if (result % 3 == 0) {
        self.webButton.enabled = YES;
    } else {
        self.webButton.enabled = NO;
    }
    
    // if greater than 20, set background purple
    UIColor *bg;
    if (result > 20) {
        bg = [UIColor purpleColor];
    } else {
        bg = [UIColor whiteColor];
    }
    self.masterView.backgroundColor = bg;
}

- (IBAction)onWebButtonPressed:(UIButton *)sender {
    NSLog(@"web button pressed");
}


#pragma mark -
#pragma mark - Navigation


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"prepareForSegue: %@", segue.identifier);

    webViewController *dstVC = segue.destinationViewController;
    dstVC.myTitleString = self.title;
}



- (IBAction)back:(UIStoryboardSegue *)segue {
    NSLog(@"back:segue");
}

@end
