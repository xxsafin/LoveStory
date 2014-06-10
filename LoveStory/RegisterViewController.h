//
//  RegisterViewController.h
//  LoveStory
//
//  Created by Xu Xian on 14-6-10.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTTAttributedLabel.h"

@interface RegisterViewController : UIViewController< TTTAttributedLabelDelegate, UITextFieldDelegate , UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *registerLoginButton;

@property (strong, nonatomic) UINavigationController *myNavigationController;

@end
