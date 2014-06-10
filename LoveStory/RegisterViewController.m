//
//  RegisterPopupViewController.m
//  TEAEXPOIOS
//
//  Created by Xu Xian on 13-12-5.
//  Copyright (c) 2013年 Xu Xian. All rights reserved.
//

#import "RegisterViewController.h"

#import "ViewFactory.h"
#import "Common.h"

#import "AppDelegate.h"

#pragma mark - PASSWORD LENGTH
#define PASSWORD_LENGTH_MIN 6
#define PASSWORD_LENGTH_MAX 20


@interface RegisterViewController ()
{
    UIAlertView *_failAlertView;
    UIAlertView *_successAlertView;
    UIAlertView *_skipAlertView;
    
    UIView *_networkVeilView;//网络请求的veilView(刷新)
    UIActivityIndicatorView *_networkIndicator;
    BOOL rememberPassword;
}

@end

@implementation RegisterViewController

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
    
    self.userNameTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"宝宝的用户名~" attributes:@{NSForegroundColorAttributeName: UIColorFromRGB(0XBBBBBB)}];
    self.passwordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"宝宝的密码~" attributes:@{NSForegroundColorAttributeName: UIColorFromRGB(0XBBBBBB)}];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

#pragma mark - Init

#pragma mark - TEXTFIELD AND PICKER TOUCH EVENT

//hide keyboard or date picker when blank space is touched
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (IBAction)textFieldFinished:(id)sender
{
    [sender resignFirstResponder];
}

#pragma mark - TTTAttributed Label
-(void)setUnderLinedLabel:(TTTAttributedLabel *)label withText:(NSString *)text withURLString:(NSString *)urlString{
    label.lineBreakMode = UILineBreakModeWordWrap;
    label.numberOfLines = 0;
    label.linkAttributes = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:YES] forKey:(NSString *)kCTUnderlineStyleAttributeName];
    label.backgroundColor =[UIColor clearColor];
    
    label.text =text;
    label.delegate =self;
    NSRange linkRange = NSMakeRange(0, [label.text length]);
    NSURL *url = [NSURL URLWithString:urlString];
    [label addLinkToURL:url withRange:linkRange];
}


#pragma mark - User Login Block
-(IBAction)pressLogin:(id)sender
{
    //login user
    if(![self checkContentsValid])
    {
        return;
    }
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *password = [defaults stringForKey:self.userNameTextField.text];
    if(password && [password compare:self.passwordTextField.text] == NSOrderedSame)
    {
        //登陆成功
        [self onUserloginReturnedWithStatus:0 userID:1];
    }
    else
    {
        //密码错误
        [self onUserloginReturnedWithStatus:5 userID:1];
    }
}

-(BOOL)checkContentsValid
{
    if(self.userNameTextField.text.length == 0)
    {
        [self alertWithMessage:@"用户名不可为空" isSuccessAlert:NO];
        return NO;
    }
    else if (self.passwordTextField.text.length < PASSWORD_LENGTH_MIN)
    {
        [self alertWithMessage:[NSString stringWithFormat:@"密码长度不可短于%d",PASSWORD_LENGTH_MIN] isSuccessAlert:NO];
        return NO;
    }
    else if (self.passwordTextField.text.length > PASSWORD_LENGTH_MAX)
    {
        [self alertWithMessage:[NSString stringWithFormat:@"密码长度不可长于%d",PASSWORD_LENGTH_MAX] isSuccessAlert:NO];
        return NO;
    }
    else
    {
        return YES;
    }
}

-(void)alertWithMessage:(NSString *)message isSuccessAlert:(BOOL)isSuccessAlert
{
    if(isSuccessAlert)
    {
        if(!_successAlertView)
        {
            _successAlertView = [[UIAlertView alloc] initWithTitle:nil
                                                           message:message
                                                          delegate:nil
                                                 cancelButtonTitle:@"确定"
                                                 otherButtonTitles: nil];
            
            _successAlertView.delegate =self;
        }
        else
        {
            _successAlertView.message = message;
        }
        [_successAlertView show];
    }
    else
    {
        if(!_failAlertView)
        {
            _failAlertView = [[UIAlertView alloc] initWithTitle:nil
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles: nil];
            
            _failAlertView.delegate =self;
        }
        else
        {
            _failAlertView.message = message;
        }
        [_failAlertView show];
    }
}

-(void)onUserloginReturnedWithStatus:(int16_t)status userID:(int16_t)userID
{
    [self hideNetworkVeilView];
    
    switch (status) {
            //login success
        case 0:
        {
            [self popToLoggedUserView];
            
            break;
        }
        case 5:
        {
            [self alertWithMessage:@"密码错误" isSuccessAlert:NO];
            break;
        }
            
        case -1:
        {
            [self alertWithMessage:@"请检查网络连接" isSuccessAlert:NO];
        }
            
        default:
        {
            [self alertWithMessage:@"请求失败！" isSuccessAlert:NO];
            break;
        }
    }
    
}

#pragma mark - VeilView
- (void)showNetworkVeilView
{
    if (!_networkVeilView)
    {
        _networkVeilView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [_networkVeilView setUserInteractionEnabled:YES];
        
        _networkVeilView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        _networkIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        _networkIndicator.center = CGPointMake(_networkVeilView.frame.size.width * 0.5,
                                               _networkVeilView.frame.size.height * 0.5);
        
        [_networkVeilView addSubview:_networkIndicator];
        [self.view addSubview:_networkVeilView];
    }
    [_networkIndicator startAnimating];
    _networkVeilView.hidden = NO;
}

- (void)hideNetworkVeilView
{
    [_networkIndicator stopAnimating];
    _networkVeilView.hidden = YES;
}

#pragma mark - UIAlertView Delegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(_failAlertView == alertView)
    {
        //do nothing
    }
    else if (_successAlertView == alertView)
    {
        [self popToLoggedUserView];
    }
    else if (_skipAlertView == alertView)
    {
        switch (buttonIndex) {
            case 0:
                ;//do nothing
                break;
            case 1:
                [self fade];
                break;
                
            default:
                break;
        }
    }
}

-(void)fade
{
    //hide this view
    [UIView animateWithDuration:0.4 animations:^{
        self.view.transform = CGAffineTransformMakeScale(0, 0);
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
        [[AppDelegate sharedAppDelegate] removeRegisterWindow];
    }];
}

-(void)popToLoggedUserView
{
    [self fade];
    
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * 60 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //
    //        [[AppDelegate sharedAppDelegate] openRegisterWindow];
    //
    //    });
}

@end
