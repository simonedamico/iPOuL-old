//
//  THMPOuLMap.h
//  iPOuL
//
//  Created by Simone D'Amico on 13/02/11.
//  Copyright 2011 Maxim s.n.c. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MKMapView;


@interface THMPOuLMap : UIViewController {
	
	MKMapView * map;
	
}

@property(nonatomic, retain) IBOutlet MKMapView * map;

@end
