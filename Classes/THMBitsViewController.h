//
//  MainViewController.h
//  iPOuL
//
//  Created by Simone D'Amico on 26/01/11.
//  Copyright 2011 Maxim s.n.c. All rights reserved.
//


@interface THMBitsViewController : UIViewController {
	UILabel * statoSedeLabel;
	NSMutableString * statoSede;
	UIActivityIndicatorView * activityIndicator;
}

@property(nonatomic, retain) IBOutlet UILabel * statoSedeLabel;
@property(nonatomic, retain) IBOutlet UIActivityIndicatorView * activityIndicator;
@property(nonatomic, retain) NSMutableString * statoSede;


- (void)connectToBITS;

@end
