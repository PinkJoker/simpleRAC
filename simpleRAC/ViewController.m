//
//  ViewController.m
//  simpleRAC
//
//  Created by 我叫MT on 17/5/10.
//  Copyright © 2017年 Pinksnow. All rights reserved.
//

#import "ViewController.h"
#import "SubsciberViewModal.h"
#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
@interface ViewController ()

@property(nonatomic, strong)UITextField *textField;
@property(nonatomic, strong)UIButton *button;
@property(nonatomic, strong)UILabel *statusLabel;
@property(nonatomic, strong)SubsciberViewModal *viewModal;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
     self.viewModal = [SubsciberViewModal new];
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(50, 200, kWidth - 100, 44)];
    self.textField.borderStyle = UITextBorderStyleBezel;
    [self.view addSubview:self.textField];
    self.button = [[UIButton alloc]initWithFrame:CGRectMake(50, 254, kWidth - 100, 44)];
    self.button.backgroundColor = [UIColor greenColor];
    [self.button setTitle:@"subscribe" forState:UIControlStateNormal];
    [self.view addSubview:self.button];
    self.statusLabel = [[UILabel alloc]init];
    self.statusLabel.frame = CGRectMake(50, 304, kWidth - 100, 44);
    self.statusLabel.textAlignment = NSTextAlignmentCenter;
    self.statusLabel.text = @".........";
    self.statusLabel.textColor = [UIColor blackColor];
    [self.view addSubview:self.statusLabel];
    
   
    [self bindWithViewModal];
}

-(void)bindWithViewModal
{
    RAC(self.viewModal,email) = self.textField.rac_textSignal;
    self.button.rac_command = self.viewModal.subscribeCommand;
    RAC(self.statusLabel, text) = RACObserve(self.viewModal, statusMessage);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
