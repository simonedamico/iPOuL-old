//
//  MainViewController.h
//  iPOuL
//
//  Created by Simone D'Amico on 26/01/11.
//  Copyright 2011 Maxim s.n.c. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate> {
	UILabel * statoSedeLabel;
	NSMutableString * statoSede;
	UIActivityIndicatorView * activityIndicator;
}

@property(nonatomic, retain) IBOutlet UILabel * statoSedeLabel;
@property(nonatomic, retain) IBOutlet UIActivityIndicatorView * activityIndicator;
@property(nonatomic, retain) NSMutableString * statoSede;


- (IBAction)showInfo:(id)sender;

- (void)connectToBITS;

@end
