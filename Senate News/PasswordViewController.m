//
//  PasswordViewController.m
//  Senate News
//
//  Created by Yoman on 11/9/15.
//  Copyright (c) 2015 GITS. All rights reserved.
//

#import "PasswordViewController.h"
#import "HomeViewController.h"
@interface PasswordViewController (){
    int numberCount;
    
    NSString *str1;
    NSString *str2;
    NSString *str3;
    NSString *str4;
    NSString *str5;
    NSString *str6;
}
@end

@implementation PasswordViewController

#pragma mark - Hidden StatusBar
-(BOOL)prefersStatusBarHidden{
    return true;
}

#pragma mark - View Life Cycle

-(void)viewDidLoad{
    [super viewDidLoad];
    
    //=======check on screen to support all keypad
    if([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad){
   
        _keyPadHeight.constant = 400;
    }else{
        if([UIScreen mainScreen].bounds.size.height ==480){
            _keyUpLabelSpp.constant = 20;
        }else if([UIScreen mainScreen].bounds.size.height == 568){
            _keyUpLabelSpp.constant = 65;
        }else if([UIScreen mainScreen].bounds.size.height == 667){
            _keyUpLabelSpp.constant = 95;
        }else{
            _keyUpLabelSpp.constant = 110;
        }
    }

    
    //=======disable click on pin button
    numberCount = 0;
    for(int i=1;i<7;i++){
        UIButton *button=(UIButton *)[self.view viewWithTag:100+i];
        button.userInteractionEnabled=false;
    }
    
}
#pragma mark - Button Acction
- (IBAction)btnDismissAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnNumberPress:(UIButton*)sender {
    numberCount++;
    UIButton *button=(UIButton *)[self.view viewWithTag:100+numberCount];
    button.selected=true;
    switch (button.tag) {
        case 101:
            str1=[NSString stringWithFormat:@"%ld",(long)sender.tag];
            break;
        case 102:
            str2=[NSString stringWithFormat:@"%ld",(long)sender.tag];
            break;
        case 103:
            str3=[NSString stringWithFormat:@"%ld",(long)sender.tag];
            break;
        case 104:
            str4=[NSString stringWithFormat:@"%ld",(long)sender.tag];
            break;
        case 105:
            str5=[NSString stringWithFormat:@"%ld",(long)sender.tag];
            break;
        case 106:
            str6=[NSString stringWithFormat:@"%ld",(long)sender.tag];
            break;
        default:
            break;
    }
    
    if(numberCount>=6){
        numberCount=6;
        
        //=====Just for Testing
        if([[NSString stringWithFormat:@"%@%@%@%@%@%@",str1,str2,str3,str4,str5,str6]  isEqual: @"123456"]){
            _btnCheckMoveOn.titleLabel.text = @"ត្រឹមត្រូវ ចុចបន្ត";
            _btnCheckMoveOn.userInteractionEnabled = true;
        }else{
            
            _btnCheckMoveOn.titleLabel.text = @"មិនត្រឹមត្រូវទេ";
            _btnCheckMoveOn.userInteractionEnabled = false;
        }
        

        [UIView animateWithDuration:2
                         animations:^{
                             _keyCorrentUp.constant = 10;
                             [self.view setNeedsLayout];
                         }];
    }
}

- (IBAction)btnClearNumber:(id)sender {
    numberCount--;
    UIButton *button=(UIButton *)[self.view viewWithTag:100+numberCount+1];
    button.selected=false;
    if(numberCount<=0){
        numberCount=0;
    }
    
    [UIView animateWithDuration:2
                     animations:^{
                         _keyCorrentUp.constant = -35;
                         [self.view setNeedsLayout];
                     }];

}
- (IBAction)btnLoginAction:(UIButton *)sender {
    [self performSegueWithIdentifier:@"PwdMainSegue" sender:nil];
}

@end
