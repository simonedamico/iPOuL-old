//
//  THMDocumentiViewController.m
//  iPOuL
//
//  Created by Simone D'Amico on 13/02/11.
//  Copyright 2011 Maxim s.n.c. All rights reserved.
//

#import "THMDocumentiViewController.h"
#import <QuickLook/QuickLook.h>

typedef enum {
	Associazione,
	Giornalinux,
	Prontuari,
	
}Sezioni;


@implementation THMDocumentiViewController

@synthesize tableView;
@synthesize docInteractionController;

- (void)setupDocumentControllerWithURL:(NSURL *)url
{
    if (self.docInteractionController == nil)
    {
        self.docInteractionController = [UIDocumentInteractionController interactionControllerWithURL:url];
        self.docInteractionController.delegate = self;
    }
    else
    {
        self.docInteractionController.URL = url;
    }
}

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
			num = 9;
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

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
	
	NSString * titleOfSection;
	
	switch (section) {
		case Associazione:
			titleOfSection = @"Associazione";
			break;
		case Giornalinux:
			titleOfSection = @"Giornalinux";
			break;
		case Prontuari:
			titleOfSection = @"Prontuari";
			break;
		default:
			titleOfSection = nil;
			break;
	}
	
	return titleOfSection;
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
			
		case Prontuari:
			switch (indexPath.row) {
				case 0:
					testo = @"Prontuario Bash";
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	NSString * nomePdf = nil;

	
	switch (indexPath.section) {
			
		case Associazione:
			switch (indexPath.row) {
				case 0:
					nomePdf = @"statuto.pdf";
					break;
				default:
					break;
			}
			break;
			
		case Giornalinux:
			switch (indexPath.row) {
				case 0:
					nomePdf = @"giornalinux0.pdf";
					break;
				case 1:
					nomePdf = @"giornalinux1.pdf";
					break;
				case 2:
					nomePdf = @"giornalinux2.pdf";
					break;
				case 3:
					nomePdf = @"giornalinux3.pdf";
					break;
				case 4:
					nomePdf = @"giornalinux4.pdf";
					break;
				case 5:
					nomePdf = @"giornalinux5.pdf";
					break;
				case 6:
					nomePdf = @"giornalinux6.pdf";
					break;
				case 7:
					nomePdf = @"giornalinux7.pdf";
					break;
				case 8:
					nomePdf = @"giornalinux8.pdf";
					break;					
					
				default:
					break;
			}
			
			
			break;
			
		case Prontuari:
			switch (indexPath.row) {
				case 0:
					nomePdf = @"comandi_comuni.pdf";
					break;
				default:
					break;
			}
			break;
			
			
		default:
			break;
	}
	
	NSURL * fileURL =  [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:nomePdf ofType:nil]];	
	[self setupDocumentControllerWithURL:fileURL];
	[self.docInteractionController presentPreviewAnimated:YES];
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
	
}


- (UIViewController *)documentInteractionControllerViewControllerForPreview:(UIDocumentInteractionController *)interactionController
{
    return self;
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
