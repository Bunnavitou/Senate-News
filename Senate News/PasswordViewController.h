//
//  PasswordViewController.h
//  Senate News
//
//  Created by Yoman on 11/9/15.
//  Copyright (c) 2015 GITS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PasswordViewController : UIViewController

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *keyCorrentUp;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *btnPinPoint;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *btnNumber;

@property (strong, nonatomic) IBOutlet UIButton *btnCheckMoveOn;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *keyUpLabelSpp;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *keyPadHeight;

@end
