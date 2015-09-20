//
//  SecondViewController.h
//  estereoplata
//
//  Created by Leonel Roberto Perea Trejo on 12/09/13.
//  Copyright (c) 2013 Leonel Roberto Perea Trejo. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <MessageUI/MFMessageComposeViewController.h>
#import <MessageUI/MessageUI.h>

@interface SecondViewController : UIViewController <MFMessageComposeViewControllerDelegate, UINavigationControllerDelegate>
{
    IBOutlet UIButton *buttonSMS;
}
- (IBAction)buttonPressed:(id)sender;
- (IBAction)call1:(id)sender;
- (IBAction)call2:(id)sender;
- (IBAction)facebook:(id)sender;
- (IBAction)twitter:(id)sender;
@end
