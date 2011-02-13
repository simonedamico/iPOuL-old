//
//  THMDocumentiViewController.m
//  iPOuL
//
//  Created by Simone D'Amico on 13/02/11.
//  Copyright 2011 Maxim s.n.c. All rights reserved.
//

#import "THMDocumentiViewController.h"

typedef enum {
	Associazione,
	Giornalinux,
	Prontuari,
	
}Sezioni;


@implementation THMDocumentiViewController

@synthesize tableView;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger num;
	
	switch (section) {
		case Associazione:
			num = 1;
			break;
		case Giornalinux:
			num = 6;
			break;
		case Prontuari:
			num = 1;
			break;
		default:
			num = 0;
			break;
	}
	
	return num;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"elemento";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.
	
	NSString * testo = nil;
	
	switch (indexPath.section) {
			
		case Associazione:
			switch (indexPath.row) {
				case 0:
					testo = @"Statuto";
					break;
				default:
					break;
			}
			break;
			
		case Giornalinux:
			switch (indexPath.row) {
				case 0:
					testo = @"Giornalinux 0";
					break;
				case 1:
					testo = @"Giornalinux 1";
					break;
				case 2:
					testo = @"Giornalinux 2";
					break;
				case 3:
					testo = @"Giornalinux 3";
					break;
				case 4:
					testo = @"Giornalinux 4";
					break;
				case 5:
					testo = @"Giornalinux 5";
					break;
				case 6:
					testo = @"Giornalinux 6";
					break;
				case 7:
					testo = @"Giornalinux 7";
					break;
				case 8:
					testo = @"Giornalinux 8";
					break;					
					
				default:
					break;
			}

			break;

		default:
			break;
	}
	
	cell.textLabel.text = testo;
	
    return cell;
}

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

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
