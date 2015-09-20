//
//  FirstViewController.h
//  estereoplata
//
//  Created by Leonel Roberto Perea Trejo on 12/09/13.
//  Copyright (c) 2013 Leonel Roberto Perea Trejo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AudioStreamer;

@interface FirstViewController : UIViewController <NSXMLParserDelegate>{
    AudioStreamer *streamer;
    IBOutlet UIButton *button;
    BOOL playing;
    @public
    IBOutlet UILabel *cancionActual;
    IBOutlet UILabel *artistaActual;
    IBOutlet UILabel *oyentes;
    IBOutlet UIImageView *album_image;
    IBOutlet UIProgressView *progreso;
    IBOutlet UIView *volumen;
    NSMutableString *currentNodeContent;
    NSString *valorPasado;
}
@property (nonatomic, strong) NSString *valorPasado;
- (IBAction)buttonPressed:(id)sender;
- (IBAction)eliminar;
@end
