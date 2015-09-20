//
//  SecondViewController.m
//  estereoplata
//
//  Created by Leonel Roberto Perea Trejo on 12/09/13.
//  Copyright (c) 2013 Leonel Roberto Perea Trejo. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult) result
{
    switch (result) {
        case MessageComposeResultCancelled:{
            UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Cancelado" message:@"Tu mensaje ha sido cancela!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [warningAlert show];
            break;
        }
        case MessageComposeResultFailed:
        {
            UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Fallo" message:@"Ha fallado el envio de tu mensaje!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [warningAlert show];
            break;
        }
            
        case MessageComposeResultSent:{
            UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Enviado" message:@"Tu mensaje ha sido enviado!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [warningAlert show];
            break;
        }
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)sendSMS:(NSString *)message recipientList:(NSArray *)recipents
{
    MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init];
    messageController.messageComposeDelegate = self;
    messageController.recipients = recipents;
    messageController.body = message;
    
    [self presentViewController:messageController animated:YES completion:NULL];
}

- (IBAction)buttonPressed:(id)sender
{
    if(![MFMessageComposeViewController canSendText]) {
        UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Tu dispositivo no soporta el envio de Mensajes de texto!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [warningAlert show];
        return;
    }
    
    [self sendSMS:@"ZER " recipientList:[NSArray arrayWithObjects:@"30500", NULL]];
}
- (IBAction)call1:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:4929229965"]];
}
- (IBAction)call2:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:4929226157"]];
}
- (IBAction)facebook:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.facebook.com/stereozer"]];
}
- (IBAction)twitter:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com"]];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
