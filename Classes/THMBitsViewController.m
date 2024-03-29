//
//  MainViewController.m
//  iPOuL
//
//  Created by Simone D'Amico on 26/01/11.
//  Copyright 2011 Maxim s.n.c. All rights reserved.
//

#import "THMBitsViewController.h"


@implementation THMBitsViewController

@synthesize statoSedeLabel;
@synthesize statoSede;
@synthesize activityIndicator;



- (void)connectToBITS{
	NSURL * bitsURL = [NSURL URLWithString:@"http://bits.otacon22.it/read_app.txt"];
	NSURLRequest * request = [NSURLRequest requestWithURL:bitsURL];
	NSURLConnection * connection = [NSURLConnection connectionWithRequest:request delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
	if (nil != self.statoSede) {
		[self.statoSede appendString:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding ]];
	}else {
		self.statoSede = [[NSMutableString alloc] initWithData:data encoding:NSUTF8StringEncoding];
	}

}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
	[self.activityIndicator stopAnimating];
	if ([self.statoSede isEqualToString:@"1"]) {
		self.statoSedeLabel.text = @"Aperta";
		self.statoSedeLabel.textColor = [UIColor greenColor];
	}else if ([self.statoSede isEqualToString:@"0"]){
		self.statoSedeLabel.text = @"Chiusa";
		self.statoSedeLabel.textColor = [UIColor redColor];
	}else{
		self.statoSedeLabel.text = @"in stato Shroedinger";
		self.statoSedeLabel.textColor = [UIColor orangeColor];
	}
	self.activityIndicator.hidden = YES;
	self.statoSedeLabel.hidden = NO;
	self.statoSede = nil;
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
	UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle: [error localizedDescription]
														 message: [error localizedFailureReason]
														delegate: nil
											   cancelButtonTitle: @"OK"
											   otherButtonTitles: nil];
	[errorAlert show];
	[errorAlert release];
	[self.activityIndicator stopAnimating];
}

- (void)viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	self.statoSedeLabel.hidden = YES;
	[self connectToBITS];
	self.activityIndicator.hidden = NO;
	[self.activityIndicator startAnimating];
}

#pragma mark -
#pragma mark Roba di supporto allo shake

- (BOOL)canBecomeFirstResponder {
	return YES;
}

- (void)viewDidAppear:(BOOL)animated{
	[super viewDidAppear:animated];
	[self becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated{
	[self resignFirstResponder];
	[super viewWillDisappear:animated];
}


- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
	if (motion == UIEventSubtypeMotionShake) {
		self.statoSedeLabel.hidden = YES;
		[self connectToBITS];
		self.activityIndicator.hidden = NO;
		[self.activityIndicator startAnimating];
	}
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
	self.statoSedeLabel = nil;
	self.statoSede = nil;
	self.activityIndicator = nil;
}

- (void)dealloc {
    [super dealloc];
}


@end
