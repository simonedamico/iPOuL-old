//
//  THMDocumentiViewController.h
//  iPOuL
//
//  Created by Simone D'Amico on 13/02/11.
//  Copyright 2011 Maxim s.n.c. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuickLook/QuickLook.h>

#define NUMERI_GIORNALINUX 11

@interface THMDocumentiViewController : UIViewController <UITableViewDelegate, UITableViewDelegate, UIDocumentInteractionControllerDelegate> {
	UITableView * tableView;
	UIDocumentInteractionController * docInteractionController;
}

@property(nonatomic, retain) IBOutlet UITableView * tableView;
@property(nonatomic, retain) UIDocumentInteractionController * docInteractionController;


@end
