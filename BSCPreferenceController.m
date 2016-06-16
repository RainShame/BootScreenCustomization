#import <UIKit/UIKit.h>
#import <Cephei/HBListController.h>
#import <Cephei/HBAppearanceSettings.h>
#import <Preferences/PSSpecifier.h>
#import <Social/Social.h>
#import <HBPreferences.h>
#import "Prefs.h"


#define PS_TWITTER_URL @"twitter://user?screen_name=ca13ra1"


@interface BSCPreferenceController : HBListController
@end


@implementation BSCPreferenceController


- (id)init
{
	if (self == [super init]) {
		HBAppearanceSettings *appearanceSettings = [[HBAppearanceSettings alloc] init];
		appearanceSettings.tintColor = [UIColor blackColor];
		appearanceSettings.invertedNavigationBar = YES;
		self.hb_appearanceSettings = appearanceSettings;
		UIButton *heart = [[[UIButton alloc] initWithFrame:CGRectZero] autorelease];
		UIImage *image = [UIImage imageNamed:@"Heart" inBundle:[NSBundle bundleWithPath:@"/Library/PreferenceBundles/BSCSettings.bundle"]];
		image = [image _flatImageWithColor:UIColor.whiteColor];
		[heart setImage:image forState:UIControlStateNormal];
		[heart sizeToFit];
		[heart addTarget:self action:@selector(loved) forControlEvents:UIControlEventTouchUpInside];
		self.navigationItem.rightBarButtonItem =  [[[UIBarButtonItem alloc] initWithCustomView:heart] autorelease];
	}
	return self;
}

- (void)loved
{
	SLComposeViewController *twitter = [[SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter] retain];
	[twitter setInitialText:@"#BootScreenCustomization by @ca13ra1 is super awesome!"];
	if (twitter != nil)
		[[self navigationController] presentViewController:twitter animated:YES completion:nil];
	[twitter release];
}


- (void)twitter:(id)param
{
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:PS_TWITTER_URL]];
}

- (void)killBB:(id)param
{
	system("killall backboardd");
}

- (NSArray *)specifiers
{
	if (_specifiers == nil) {
		NSMutableArray *specs = [NSMutableArray arrayWithArray:[self loadSpecifiersFromPlistName:@"BootScreenCustomization" target:self]];
		_specifiers = [specs copy];
	}
	return _specifiers;
}

@end