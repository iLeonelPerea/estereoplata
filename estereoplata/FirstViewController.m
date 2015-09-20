//
//  FirstViewController.m
//  estereoplata
//
//  Created by Leonel Roberto Perea Trejo on 12/09/13.
//  Copyright (c) 2013 Leonel Roberto Perea Trejo. All rights reserved.
//

#import "FirstViewController.h"
#import "AudioStreamer.h"
#import <QuartzCore/CoreAnimation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <CFNetwork/CFNetwork.h>

@interface FirstViewController ()

@end

@implementation FirstViewController

@synthesize valorPasado = _valorPasado;

//
// destroyStreamer
//
// Removes the streamer, the UI update timer and the change notification
//
- (void)destroyStreamer
{
	if (streamer)
	{
		[[NSNotificationCenter defaultCenter]
         removeObserver:self
         name:ASStatusChangedNotification
         object:streamer];
        /*
		[progressUpdateTimer invalidate];
		progressUpdateTimer = nil;
		*/
		[streamer stop];
		[streamer release];
		streamer = nil;
	}
}

//
// createStreamer
//
// Creates or recreates the AudioStreamer object.
//
- (void)createStreamer
{
	if (streamer)
	{
		return;
	}
    
	[self destroyStreamer];
    NSString *escapedValue = nil;
	if ([valorPasado isEqualToString:@"0"]) {
        escapedValue = (NSString *)CFURLCreateStringByAddingPercentEscapes(nil, (CFStringRef)@"Http://Zer.zuperdns.net:8901", NULL, NULL, kCFStringEncodingUTF8);
    }else if ([valorPasado isEqualToString:@"1"]){
        escapedValue = (NSString *)CFURLCreateStringByAddingPercentEscapes(nil, (CFStringRef)@"Http://Zer.zuperdns.net:8950", NULL, NULL, kCFStringEncodingUTF8);
    }else if ([valorPasado isEqualToString:@"2"]){
        escapedValue = (NSString *)CFURLCreateStringByAddingPercentEscapes(nil, (CFStringRef)@"Http://Zer.zuperdns.net:9007", NULL, NULL, kCFStringEncodingUTF8);
    }else if ([valorPasado isEqualToString:@"3"]){
        escapedValue = (NSString *)CFURLCreateStringByAddingPercentEscapes(nil, (CFStringRef)@"Http://Zer.zuperdns.net:9330", NULL, NULL, kCFStringEncodingUTF8);
    }else if ([valorPasado isEqualToString:@"4"]){
        escapedValue = (NSString *)CFURLCreateStringByAddingPercentEscapes(nil, (CFStringRef)@"Http://Zer.zuperdns.net:9501", NULL, NULL, kCFStringEncodingUTF8);
    }else if ([valorPasado isEqualToString:@"5"]){
        escapedValue = (NSString *)CFURLCreateStringByAddingPercentEscapes(nil, (CFStringRef)@"Http://Zer.zuperdns.net:9570", NULL, NULL, kCFStringEncodingUTF8);
    }else if ([valorPasado isEqualToString:@"6"]){
        escapedValue = (NSString *)CFURLCreateStringByAddingPercentEscapes(nil, (CFStringRef)@"Http://Zer.zuperdns.net:9650", NULL, NULL, kCFStringEncodingUTF8);
    }else if ([valorPasado isEqualToString:@"7"]){
        escapedValue = (NSString *)CFURLCreateStringByAddingPercentEscapes(nil, (CFStringRef)@"Http://Zer.zuperdns.net:9930", NULL, NULL, kCFStringEncodingUTF8);
    }else if ([valorPasado isEqualToString:@"8"]){
        escapedValue = (NSString *)CFURLCreateStringByAddingPercentEscapes(nil, (CFStringRef)@"Http://Zer.zuperdns.net:9850", NULL, NULL, kCFStringEncodingUTF8);
    }else if ([valorPasado isEqualToString:@"9"]){
        escapedValue = (NSString *)CFURLCreateStringByAddingPercentEscapes(nil, (CFStringRef)@"Http://Zer.zuperdns.net:2001", NULL, NULL, kCFStringEncodingUTF8);
    }else if ([valorPasado isEqualToString:@"10"]){
        escapedValue = (NSString *)CFURLCreateStringByAddingPercentEscapes(nil, (CFStringRef)@"Http://Zer.zuperdns.net:1021", NULL, NULL, kCFStringEncodingUTF8);
    }else if ([valorPasado isEqualToString:@"11"]){
        escapedValue = (NSString *)CFURLCreateStringByAddingPercentEscapes(nil, (CFStringRef)@"Http://Zer.zuperdns.net:1045", NULL, NULL, kCFStringEncodingUTF8);
    }else if ([valorPasado isEqualToString:@"12"]){
        escapedValue = (NSString *)CFURLCreateStringByAddingPercentEscapes(nil, (CFStringRef)@"Http://Zer.zuperdns.net:3006", NULL, NULL, kCFStringEncodingUTF8);
    }else if ([valorPasado isEqualToString:@"13"]){
        escapedValue = (NSString *)CFURLCreateStringByAddingPercentEscapes(nil, (CFStringRef)@"Http://Zer.zuperdns.net:1065", NULL, NULL, kCFStringEncodingUTF8);
    }else if ([valorPasado isEqualToString:@"14"]){
        escapedValue = (NSString *)CFURLCreateStringByAddingPercentEscapes(nil, (CFStringRef)@"Http://Zer.zuperdns.net:1650", NULL, NULL, kCFStringEncodingUTF8);
    }
    
	NSURL *url = [NSURL URLWithString:escapedValue];
	streamer = [[AudioStreamer alloc] initWithURL:url];
	
    /*
	progressUpdateTimer =
    [NSTimer
     scheduledTimerWithTimeInterval:0.1
     target:self
     selector:@selector(updateProgress:)
     userInfo:nil
     repeats:YES];
     */
	[[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(playbackStateChanged:)
     name:ASStatusChangedNotification
     object:streamer];
}

//
// viewDidLoad
//
// Creates the volume slider, sets the default path for the local file and
// creates the streamer immediately if we already have a file at the local
// location.
//
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    MPVolumeView *volumeView = [[MPVolumeView alloc] initWithFrame:volumen.bounds];
	[volumen addSubview:volumeView];
	[volumeView sizeToFit];
    
	[button setImage:[UIImage imageNamed:@"play_icon"] forState:UIControlStateNormal];
    [self createStreamer];
    playing = true;
    NSURL * url = nil;
    if ([valorPasado isEqualToString:@"0"]) {
        url = [NSURL URLWithString:@"http://zuperhosting.net/templatesesp/players/listeners.php?puerto=8901&server=live"];
    }else if ([valorPasado isEqualToString:@"1"]) {
        url = [NSURL URLWithString:@"http://zuperhosting.net/templatesesp/players/listeners.php?puerto=8950&server=live"];
    }else if ([valorPasado isEqualToString:@"2"]) {
        url = [NSURL URLWithString:@"http://zuperhosting.net/templatesesp/players/listeners.php?puerto=9007&server=live"];
    }else if ([valorPasado isEqualToString:@"3"]) {
        url = [NSURL URLWithString:@"http://zuperhosting.net/templatesesp/players/listeners.php?puerto=9330&server=live"];
    }else if ([valorPasado isEqualToString:@"4"]) {
        url = [NSURL URLWithString:@"http://zuperhosting.net/templatesesp/players/listeners.php?puerto=9501&server=live"];
    }else if ([valorPasado isEqualToString:@"5"]) {
        url = [NSURL URLWithString:@"http://zuperhosting.net/templatesesp/players/listeners.php?puerto=9570&server=live"];
    }else if ([valorPasado isEqualToString:@"6"]) {
        url = [NSURL URLWithString:@"http://zuperhosting.net/templatesesp/players/listeners.php?puerto=9650&server=live"];
    }else if ([valorPasado isEqualToString:@"7"]) {
        url = [NSURL URLWithString:@"http://zuperhosting.net/templatesesp/players/listeners.php?puerto=9930&server=live"];
    }else if ([valorPasado isEqualToString:@"8"]) {
        url = [NSURL URLWithString:@"http://zuperhosting.net/templatesesp/players/listeners.php?puerto=9850&server=live"];
    }else if ([valorPasado isEqualToString:@"9"]) {
        url = [NSURL URLWithString:@"http://zuperhosting.net/templatesesp/players/listeners.php?puerto=2001&server=live"];
    }else if ([valorPasado isEqualToString:@"10"]) {
        url = [NSURL URLWithString:@"http://zuperhosting.net/templatesesp/players/listeners.php?puerto=1021&server=live"];
    }else if ([valorPasado isEqualToString:@"11"]) {
        url = [NSURL URLWithString:@"http://zuperhosting.net/templatesesp/players/listeners.php?puerto=1045&server=live"];
    }else if ([valorPasado isEqualToString:@"12"]) {
        url = [NSURL URLWithString:@"http://zuperhosting.net/templatesesp/players/listeners.php?puerto=3006&server=live"];
    }else if ([valorPasado isEqualToString:@"13"]) {
        url = [NSURL URLWithString:@"http://zuperhosting.net/templatesesp/players/listeners.php?puerto=1065&server=live"];
    }else if ([valorPasado isEqualToString:@"14"]) {
        url = [NSURL URLWithString:@"http://zuperhosting.net/templatesesp/players/listeners.php?puerto=1650&server=live"];
    }
    NSData *data = [[NSData alloc]initWithContentsOfURL:url];
    NSXMLParser *parser = [[NSXMLParser alloc]initWithData:data];
    parser.delegate = self;
    [parser parse];
}

-(void)setValorPasado:(NSString*)valorPasados
{
    //NSLog(@"%@",valorPasado);
    valorPasado = valorPasados;
}

// This returns the string of the characters encountered thus far. You may not necessarily get the longest character run. The parser reserves the right to hand these to the delegate as potentially many calls in a row to -parser:foundCharacters:
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    currentNodeContent = (NSMutableString *)[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

// sent when an end tag is encountered. The various parameters are supplied as above.
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    if ( [elementName isEqualToString:@"artist"]) {
        [artistaActual setText:[NSString stringWithFormat:currentNodeContent]];
    }
    if ( [elementName isEqualToString:@"title"]) {
        [cancionActual setText:[NSString stringWithFormat:currentNodeContent]];
    }
    if ( [elementName isEqualToString:@"listeners"]) {
        [oyentes setText:[NSString stringWithFormat:currentNodeContent]];
    }
}


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
}

//
// buttonPressed:
//
// Handles the play/stop button. Creates, observes and starts the
// audio streamer when it is a play button. Stops the audio streamer when
// it isn't.
//
// Parameters:
//    sender - normally, the play/stop button.
//
- (IBAction)buttonPressed:(id)sender
{
	if (playing)
	{
		[self createStreamer];
		[streamer stop];
        playing = false;
        [button setImage:[UIImage imageNamed:@"play_icon"] forState:UIControlStateNormal];
        [self.view addSubview:button];
        [super viewDidLoad];
	}
	else
	{
		[streamer start];
        [button setImage:[UIImage imageNamed:@"pause_icon"] forState:UIControlStateNormal];
        playing = true;
	}
}

//
// sliderMoved:
//
// Invoked when the user moves the slider
//
// Parameters:
//    aSlider - the slider (assumed to be the progress slider)
//
- (IBAction)sliderMoved:(UISlider *)aSlider
{
	if (streamer.duration)
	{
		double newSeekTime = (aSlider.value / 100.0) * streamer.duration;
		[streamer seekToTime:newSeekTime];
	}
}

//
// playbackStateChanged:
//
// Invoked when the AudioStreamer
// reports that its playback status has changed.
//
- (void)playbackStateChanged:(NSNotification *)aNotification
{
	
}

//
// updateProgress:
//
// Invoked when the AudioStreamer
// reports that its playback progress has changed.
//
- (void)updateProgress:(NSTimer *)updatedTimer
{
    /*
	if (streamer.bitRate != 0.0)
	{
		double progress = streamer.progress;
		double duration = streamer.duration;
		
		if (duration > 0)
		{
			[positionLabel setText:
             [NSString stringWithFormat:@"Time Played: %.1f/%.1f seconds",
              progress,
              duration]];
			[progressSlider setEnabled:YES];
			[progressSlider setValue:100 * progress / duration];
		}
		else
		{
			[progressSlider setEnabled:NO];
		}
	}
	else
	{
		positionLabel.text = @"Time Played:";
	}
     */
}

//
// textFieldShouldReturn:
//
// Dismiss the text field when done is pressed
//
// Parameters:
//    sender - the text field
//
// returns YES
//
- (BOOL)textFieldShouldReturn:(UITextField *)sender
{
	[sender resignFirstResponder];
	[self createStreamer];
	return YES;
}

//
// dealloc
//
// Releases instance memory.
//
- (void)dealloc
{
	//[self destroyStreamer];
    /*
	if (progressUpdateTimer)
	{
		[progressUpdateTimer invalidate];
		progressUpdateTimer = nil;
	}
     */
    [super dealloc];
}

- (void)eliminar
{
	[self destroyStreamer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [self destroyStreamer];
    // Dispose of any resources that can be recreated.
}

@end
