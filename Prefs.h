#import "../CC.h"
#import "../PSPrefs.x"


NSString *tweakIdentifier = @"com.CC.BootScreenCustomization";


NSString *enabledKey = @"enabled";
NSString *colorKey = @"color";
NSString *colorProfileKey = @"colorProfile";



#ifdef TWEAK

BOOL enabled;

int color;
int colorProfile;

UIColor *backgroundImageColor()
{
	UIColor *bgColor = [UIColor blackColor];
	switch (colorProfile) {
		case 2:
			bgColor = [UIColor whiteColor];
			break;
		case 3:
			bgColor = [UIColor systemBlueColor];
			break;
		case 4:
			bgColor = [UIColor systemGreenColor];
			break;
		case 5:
			bgColor = [UIColor systemOrangeColor];
			break;
		case 6:
			bgColor = [UIColor systemRedColor];
			break;
		case 7:
			bgColor = [UIColor systemPinkColor];
			break;
		case 8:
			bgColor = [UIColor systemPurpleColor];
			break;
		case 9:
			bgColor = [UIColor systemTealColor];
			break;
		case 10:
			bgColor = [UIColor systemYellowColor];
			break;
	}
	return bgColor;
}

UIColor *appleImageColor()
{
	UIColor *appleColor = UIColor.whiteColor;
	switch (color) {
		case 2:
			appleColor = UIColor.blackColor;
			break;
		case 3:
			appleColor = UIColor.systemBlueColor;
			break;
		case 4:
			appleColor = UIColor.systemGreenColor;
			break;
		case 5:
			appleColor = UIColor.systemOrangeColor;
			break;
		case 6:
			appleColor = UIColor.systemRedColor;
			break;
		case 7:
			appleColor = UIColor.systemPinkColor;
			break;
		case 8:
			appleColor = UIColor.systemPurpleColor;
			break;
		case 9:
			appleColor = UIColor.systemTealColor;
			break;
		case 10:
			appleColor = UIColor.systemYellowColor;
			break;
	}
	return appleColor;
}

HaveCallback()
{
	GetPrefs()
	GetInt2(color, 1)
	GetBool2(enabled, YES)
	GetInt2(colorProfile, 1)
}

#endif