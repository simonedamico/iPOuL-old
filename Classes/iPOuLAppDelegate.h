//
//  iPOuLAppDelegate.h
//  iPOuL
//
//  Created by Simone D'Amico on 26/01/11.
//  Copyright 2011 Maxim s.n.c. All rights reserved.
//

#import <UIKit/UIKit.h>

@class THMBitsViewController;

@interface iPOuLAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    THMBitsViewController *mainViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet THMBitsViewController *mainViewController;

@end

