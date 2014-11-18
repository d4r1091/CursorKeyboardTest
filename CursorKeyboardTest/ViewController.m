//
//  ViewController.m
//  CursorKeyboardTest
//
//  Created by Dario Carlomagno on 18/11/14.
//
//

#import "ViewController.h"

@interface ViewController ()
{
    UITextPosition *currentCursorPosition;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [_myTextField becomeFirstResponder];
    
    _swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    _swipeLeft.delegate = self;
    [self.view addGestureRecognizer:_swipeLeft];
    
    _swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    _swipeRight.delegate = self;
    [self.view addGestureRecognizer:_swipeRight];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)prevButtonPressed:(id)sender {
    currentCursorPosition = [_myTextField positionFromPosition:currentCursorPosition inDirection:UITextLayoutDirectionLeft offset:1];
    [_myTextField setSelectedTextRange:[_myTextField textRangeFromPosition:currentCursorPosition toPosition:currentCursorPosition]];
}

- (IBAction)nextButtonPressed:(id)sender {
    currentCursorPosition = [_myTextField positionFromPosition:currentCursorPosition inDirection:UITextLayoutDirectionRight offset:1];
    [_myTextField setSelectedTextRange:[_myTextField textRangeFromPosition:currentCursorPosition toPosition:currentCursorPosition]];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    UITextPosition *beginning = [textField beginningOfDocument];
    [textField setSelectedTextRange:[textField textRangeFromPosition:beginning
                                                          toPosition:beginning]];
}


- (void)handleSwipe:(UISwipeGestureRecognizer *)swipe {
    
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"Left Swipe");
        [self prevButtonPressed:nil];
    }
    
    if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"Right Swipe");
        [self nextButtonPressed:nil];
    }
    
}@end
