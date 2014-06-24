//
//  MainViewController.m
//  Fbook
//
//  Created by diannas on 6/21/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "MainViewController.h"
#import <TTTAttributedLabel/TTTAttributedLabel.h>


@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIView *WhiteBg;
@property (weak, nonatomic) IBOutlet UIImageView *MainPic;
@property (weak, nonatomic) IBOutlet UIView *SocialBar;
- (IBAction)LikeIcon:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *TEXT;
- (IBAction)onCommentView:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *CommentContainerView;




@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    TTTAttributedLabel *label = [[TTTAttributedLabel alloc] initWithFrame:CGRectMake(15, 10, 280, 150)];
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor darkGrayColor];
    label.lineBreakMode = UILineBreakModeWordWrap;
    label.numberOfLines = 4;
    
    NSString *text = @"From collarless shirts to hight-waisted pants, #Her's costume designer, Casey Storm, explains how he created his fashion looks for the future: http://bit.ly/1jV9zM8";
    
    label.enabledTextCheckingTypes = NSTextCheckingTypeLink; // Automatically detect links when the label text is subsequently changed
    label.delegate = self; // Delegate methods are called when the user taps on a link (see `TTTAttributedLabelDelegate` protocol)
    
    label.text = @"Fork me on GitHub! (http://github.com/mattt/TTTAttributedLabel/)"; // Repository URL will be automatically detected and linked
    
    NSRange range = [label.text rangeOfString:@"me"];
    [label addLinkToURL:[NSURL URLWithString:@"http://github.com/mattt/"] withRange:range]; // Embedding a custom link in a substring
    
    [label setText:text afterInheritingLabelAttributesAndConfiguringWithBlock:^ NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        NSRange boldRange = [[mutableAttributedString string] rangeOfString:@"ipsum dolar" options:NSCaseInsensitiveSearch];
        NSRange strikeRange = [[mutableAttributedString string] rangeOfString:@"sit amet" options:NSCaseInsensitiveSearch];
        
        // Core Text APIs use C functions without a direct bridge to UIFont. See Apple's "Core Text Programming Guide" to learn how to configure string attributes.
        UIFont *boldSystemFont = [UIFont boldSystemFontOfSize:14];
        CTFontRef font = CTFontCreateWithName((__bridge CFStringRef)boldSystemFont.fontName, boldSystemFont.pointSize, NULL);
        if (font) {
            [mutableAttributedString addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)font range:boldRange];
            [mutableAttributedString addAttribute:kTTTStrikeOutAttributeName value:[NSNumber numberWithBool:YES] range:strikeRange];
            CFRelease(font);
        }
        
        return mutableAttributedString;
    }];
    [self.TEXT addSubview:label];
    
    self.WhiteBg.layer.borderColor = [UIColor grayColor].CGColor;
    self.WhiteBg.layer.borderWidth = .5;
    
    self.WhiteBg.layer.cornerRadius = 3;

    self.MainPic.layer.cornerRadius = 3;
    
    self.SocialBar.layer.borderColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1]. CGColor;
    self.SocialBar.layer.borderWidth = 1;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)LikeIcon:(id)sender {
}

- (IBAction)onCommentView:(id)sender {
    self.CommentContainerView.frame = CGRectMake(self.CommentContainerView.frame.origin.x, 288, self.CommentContainerView.frame.size.width, self.CommentContainerView.frame.size.height);
    
}
@end
