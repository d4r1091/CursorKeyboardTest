//
//  ViewController.h
//  CursorKeyboardTest
//
//  Created by Dario Carlomagno on 18/11/14.
//
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate, UIGestureRecognizerDelegate>


@property (weak, nonatomic) IBOutlet UITextField *myTextField;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeLeft;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *swipeRight;

- (IBAction)prevButtonPressed:(id)sender;
- (IBAction)nextButtonPressed:(id)sender;


@end

