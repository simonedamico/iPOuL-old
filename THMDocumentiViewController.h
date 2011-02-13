//
//  THMDocumentiViewController.h
//  iPOuL
//
//  Created by Simone D'Amico on 13/02/11.
//  Copyright 2011 Maxim s.n.c. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface THMDocumentiViewController : UIViewController <UITableViewDelegate, UITableViewDelegate> {
	UITableView * tableView;

}

@property(nonatomic, retain) IBOutlet UITableView * tableView;

@end
