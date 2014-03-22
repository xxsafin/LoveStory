//
//  BasePageViewController.m
//  LoveStory
//
//  Created by Xu Xian on 14-3-22.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import "BasePageViewController.h"

#import "Dairy.h"
#import "DatabaseManager.h"
#import "DairyManager.h"
#import "ViewDecorator.h"

@interface BasePageViewController ()
{
    UIKeyboardViewController *keyBoardController;
}

@end

@implementation BasePageViewController

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
    // Do any additional setup after loading the view.
    
    
    Dairy *dairy = [[DairyManager sharedDairyManager] currentDairy];
    if(dairy)
    {
        _baseTextView.text = dairy.content;
    }
    
    [ViewDecorator decorateTextView:_baseTextView];
    _baseTextView.placeholder = NSLocalizedString(@"TEXT_VIEW_PLACEHOLDER", nil);
    [AlertManager sharedAlertManager].delegate = self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
	keyBoardController=[[UIKeyboardViewController alloc] initWithControllerDelegate:self];
	[keyBoardController addToolbarToKeyboard];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Text View Delegate
//点击空白处键盘消失
//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    [self.view endEditing:YES];
//    
//    NSLog(@"touch began!");
//}

-(void)textViewDidEndEditing:(UITextView *)textView
{
    [textView resignFirstResponder];
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if( [text rangeOfCharacterFromSet:[NSCharacterSet newlineCharacterSet]].location == NSNotFound ) {
        //检测是否
        
        return YES;
    }
    //若输入了换行符,则默认已经输入完毕，隐藏键盘
    [textView resignFirstResponder];
    return NO;
}

#pragma - UIKeyboardViewController delegate methods

- (void)alttextViewDidEndEditing:(UITextView *)textView {
    NSLog(@"end editing %@", textView.text);
}

#pragma mark - Alert Manager Delegate
-(void)alertMangerReturn:(Dairy *)dairy
{
    dairy.content = _baseTextView.text;
    dairy.backgroundType = _pageViewType;
    [[DatabaseManager sharedDataManager] saveContext];
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
