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
			num = NUMERI_GIORNALINUX;
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

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(10.0, 0.0, 300.0, 44.0)];
	
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
	
	UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
	headerLabel.backgroundColor = [UIColor clearColor];
	headerLabel.opaque = NO;
	headerLabel.textColor = [UIColor yellowColor];
	headerLabel.highlightedTextColor = [UIColor whiteColor];
	headerLabel.font = [UIFont boldSystemFontOfSize:25];
	headerLabel.frame = CGRectMake(10.0, 0.0, 300.0, 44.0);
	
	
	headerLabel.text = titleOfSection;
	[customView addSubview:headerLabel];
	
	return customView;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 44.0;
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
			testo = [NSString stringWithFormat:@"Giornalinux numero %d", indexPath.row];

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
			nomePdf = [NSString stringWithFormat:@"giornalinux%d.pdf", indexPath.row];
			
			
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
