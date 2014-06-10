//
//  RegisterPopupViewController.h
//  TEAEXPOIOS
//
//  Created by Xu Xian on 13-12-5.
//  Copyright (c) 2013年 Xu Xian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTTAttributedLabel.h"

@interface LoginViewController : UIViewController< TTTAttributedLabelDelegate, UITextFieldDelegate , UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *registerLoginButton;

@property (strong, nonatomic) UINavigationController *myNavigationController;

@end
