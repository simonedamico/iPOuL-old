//
//  THMPOuLMap.m
//  iPOuL
//
//  Created by Simone D'Amico on 13/02/11.
//  Copyright 2011 Maxim s.n.c. All rights reserved.
//

#import "THMPOuLMap.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@implementation THMPOuLMap

@synthesize map;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	CLLocationCoordinate2D loc = CLLocationCoordinate2DMake(45.47717,9.229802);
	MKCoordinateRegion reg = MKCoordinateRegionMakeWithDistance(loc, 100, 100);
	self.map.region = reg;
	MKPointAnnotation * ann = [[MKPointAnnotation alloc] init];
	ann.coordinate = loc;
	ann.title = @"La sede del POuL";
	ann.subtitle = @"Venite a trovarci al Politecnico di Milano!";
	[self.map addAnnotation:ann];
	
	[map selectAnnotation:ann animated:YES];
	
	[ann release];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
