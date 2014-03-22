//
//  PasswordViewController.m
//  LoveStory
//
//  Created by Xu Xian on 14-3-22.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import "PasswordViewController.h"
#import "Params.h"

@interface PasswordViewController ()<UITextFieldDelegate>
{
    NSString *_password;
}

@end

@implementation PasswordViewController

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
    
    _textField.delegate = self;
    
    NSUserDefaults *userdefault = [NSUserDefaults standardUserDefaults];
    
    _password = [userdefault stringForKey:@"password"];
    
    if(!_password || _password.length == 0)
    {
        self.confirmButton.alpha = 1;
        self.enterButton.alpha = 0;
        self.textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"宝宝设个密码吧~" attributes:@{NSForegroundColorAttributeName: UIColorFromRGB(0X555555)}];
    }
    else
    {
        self.confirmButton.alpha = 0;
        self.enterButton.alpha = 0;
        self.textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"密码" attributes:@{NSForegroundColorAttributeName: UIColorFromRGB(0X555555)}];
    }
    
}

//点击空白处键盘消失
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    
    NSLog(@"touch began!");
}

#pragma mark - Text Field Delegate
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(!_password || _password.length == 0)
    {
        return YES;
    }
    
    NSString *str;
    
    if(string.length == 0)
    {
        str = [textField.text substringToIndex:textField.text.length - 1];
    }
    else
    {
        str = [NSString stringWithFormat:@"%@%@",textField.text,string];
    }
    
    if([str compare:_password] == NSOrderedSame)
    {
        self.enterButton.alpha = 1;
    }
    else
    {
        self.enterButton.alpha = 0;
    }
    return YES;
}

- (IBAction)pressConfirm:(id)sender
{
    _password = _textField.text;
    
    if(!_password || _password.length == 0)
    {
        return;
    }
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    [userDefault setObject:_password forKey:@"password"];
    [userDefault synchronize];
    
    _confirmButton.alpha = 0;
    _enterButton.alpha = 1;
    
}

- (IBAction)textFieldFinished:(id)sender
{
    [sender resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
